class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:id] = @user.id
      redirect_to '/', notice: "You have logged in!"
    else
      redirect_to '/', notice: "Invalid email or password"
    end
  end

  def destroy
    session[:id] = nil
    redirect_to '/', notice: "You've been logged out"
  end
end
