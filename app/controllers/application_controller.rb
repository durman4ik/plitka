class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Phones
  before_action :set_phones
  before_action :set_locale

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def set_locale
    session[:locale] = params[:locale]
    I18n.locale =  session[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
