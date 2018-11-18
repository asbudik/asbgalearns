class ShoutoutsController < ApplicationController
  def create
    user = User.find_by_id(session[:id])

    new_params = params.require(:shoutout).permit(:content)

    new_shoutout = Shoutout.new(new_params)

    if new_shoutout.save
      @shoutouts = user.shoutouts << new_shoutout

      render :json => @shoutouts
      new_like = Like.create(likes: 0)
      new_shoutout.likes << new_like
    else
      render :json => "Shout outs must be at least 6 characters"
    end

  end
end
