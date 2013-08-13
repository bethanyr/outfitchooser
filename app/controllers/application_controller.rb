class ApplicationController < ActionController::Base
  protect_from_forgery
<<<<<<< HEAD

  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
=======
>>>>>>> parent of 90740a9... updated license
end
