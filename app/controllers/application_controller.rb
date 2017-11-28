class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

 def current_controller?(names)
  names.include?(params[:controller]) unless params[:controller].blank? || false
 end

 helper_method :current_controller?

end
