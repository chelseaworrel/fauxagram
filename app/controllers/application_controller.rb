class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method(:current_user, :path_to_dashboard, :path_to_user,:path_to_root)

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def path_to_user
    params[:controller] == "users"
  end

  def path_to_dashboard
    params[:controller] == "dashboard"
  end

  def path_to_root
    params[:controller] == "welcome"
  end
end
