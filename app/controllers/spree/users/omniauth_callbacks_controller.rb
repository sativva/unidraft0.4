# class SpreeUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def facebook
  #   user = Spree::User.find_for_facebook_oauth(request.env['omniauth.auth'])

  #   if user.persisted?
  #     sign_in_and_redirect user, event: :authentication
  #     set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
  #   else
  #     session['devise.facebook_data'] = request.env['omniauth.auth']
  #     redirect_to new_user_registration_url
  #   end
  # end
  # def all
  #   user = User.from_omniauth(request.env["omniauth.auth"], request.env["omniauth.params"])
  #   raise
  #   if user.persisted?
  #     flash.notice = "Signed in!"
  #     sign_in_and_redirect(user) and return
  #   else
  #     user.save
  #     flash.notice = "Created account!"
  #     sign_in_and_redirect(user) and return
  #   end
  # end

  # alias_method :twitter, :all
  # alias_method :facebook, :all
  # alias_method :github, :all
# end

