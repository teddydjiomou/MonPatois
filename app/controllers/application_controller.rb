class ApplicationController < ActionController::Base
  protect_from_forgery
  #check_authorization
  helper_method :current_user
  
  before_filter :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def current_user
    unless session[:user_id].nil?
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
end
