GA_DASHBOARD_BUCKET = 'gadashboard'

class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = User.find_by_id(session[:id])
  end
  def new
    # @user = User.find_by_id(session[:id])
  end

  def create
    new_user = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :image_url)
    new_file_path = params[:user].permit(:image_url)

    new_user[:first_name].capitalize!
    new_user[:last_name].capitalize!

    if !new_file_path.blank?
      # NOTE: leaving this here temporarily
      # new_bucket = S3_CLIENT.buckets['gadashboard']
      # new_object.write(Pathname.new(new_file_path['image_url'].tempfile.path))

      s3_key = Time.now.to_time.to_i.to_s
      image_filepath = new_file_path['image_url'].tempfile.path
      File.open(image_filepath, 'rb') do |file|
        new_object = S3_CLIENT.put_object({
          :bucket => GA_DASHBOARD_BUCKET,
          :key => s3_key,
          :body => file
        })
      end
      new_user[:image_url] =
        "https://#{GA_DASHBOARD_BUCKET}.s3.amazonaws.com/#{s3_key}"

    else
      new_user[:image_url] =
        "https://#{GA_DASHBOARD_BUCKET}.s3.amazonaws.com/profile-1.jpg"

    end

    @user = User.new(new_user)

    if @user.save
      flash[:new_user] = "Message"
      session[:id] = @user.id
      @current_user = User.find_by_id(@user.id)
      redirect_to '/', :notice => "Successfully created an account!"
    else
      # if @user.password != @user.password_confirmation
      #   flash[:password_error] = "Message"
      # end
      @errors = @user.errors.full_messages[1]

      redirect_to "/", alert: @errors
    end
  end

  def show
    @user = User.find(params[:id])
    @current_user = User.find_by_id(session[:id])
    @shoutouts_all = @user.shoutouts
    @user_shoutouts = 0

    Like.all.each do |like|
      if like.user_likes_id == @user.id
        @user_shoutouts += 1
      end
    end
  end
  def edit
    @user = User.find(params[:id])
    @current_user = User.find(session[:id])

    if @current_user != @user
      redirect_to '/users'
    end
  end

  def update
    user = User.find(params[:id])
    updated_params = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :summary,
      :website_one,
      :website_two,
      :image_url)
    new_file_path = params[:user].permit(:image_url)

    updated_params[:first_name].capitalize!
    updated_params[:last_name].capitalize!

    if !new_file_path.blank?
      s3_key = Time.now.to_time.to_i.to_s
      image_filepath = new_file_path['image_url'].tempfile.path
      File.open(image_filepath, 'rb') do |file|
        new_object = S3_CLIENT.put_object({
          :bucket => GA_DASHBOARD_BUCKET,
          :key => s3_key,
          :body => file
        })
      end
      updated_params[:image_url] =
        "https://#{GA_DASHBOARD_BUCKET}.s3.amazonaws.com/#{s3_key}"

    else
      updated_params[:image_url] = user.image_url

    end

    if user.update_attributes(updated_params)
      redirect_to '/', :notice => "You have successfully updated your profile"
    else
      redirect_to '/', :alert => "Something went wrong with your update"
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:id] = nil

    redirect_to '/'
  end
end
