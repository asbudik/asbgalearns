class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # NOTE: it doesn't look like bucket var is accessed anywhere
  # bucket = S3_CLIENT.buckets['gadashboard']

  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end


end
