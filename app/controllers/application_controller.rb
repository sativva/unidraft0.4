class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :store_current_location, :unless => :devise_controller?

  def set_locale
    I18n.locale = params[:locale].to_s || I18n.default_locale
  end

  def default_url_options
    if Rails.env.production?
      {
        host: 'app.unidraft.co',
        locale: I18n.locale == I18n.default_locale ? nil : I18n.locale
      }
    elsif Rails.env.staging?
      {
        host: 'prep.unidraft.fr',
        locale: I18n.locale == I18n.default_locale ? nil : I18n.locale
      }
    else
      {
        host: ENV['HOST'] || 'localhost:3000',
        locale: I18n.locale == I18n.default_locale ? nil : I18n.locale
       }
    end
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  def after_sign_in_path_for(resource)
    # raise
    # request.referrer || root_path
    return request.env['omniauth.origin'] || session[:user_return_to]
    # raise
    # store_current_location || request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  private

  def store_current_location
    unless request.url.include?('cart')
      store_location_for(:user, request.url)
    end
  end

  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end

end

