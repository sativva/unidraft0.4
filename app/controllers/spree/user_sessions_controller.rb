class Spree::UserSessionsController < Devise::SessionsController
  helper 'spree/base'

  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Common
  include Spree::Core::ControllerHelpers::Order
  include Spree::Core::ControllerHelpers::Store

  def create
    authenticate_spree_user!

    if spree_user_signed_in?
      respond_to do |format|
        format.html {
          flash[:success] = Spree.t(:logged_in_succesfully)
          redirect_back_or_default(after_sign_in_path_for(spree_current_user))
        }
        format.js {
          render :json => {:user => spree_current_user,
                           :ship_address => spree_current_user.ship_address,
                           :bill_address => spree_current_user.bill_address}.to_json
        }
      end
    else
      # render :new

      redirect_to(login_path)
      # raise
      # respond_to do |format|
      #   format.html {
      #     flash[:error] = Spree.t('devise.failure.invalid')

      #     # flash.now[:error] = t('devise.failure.invalid')
      #     render :new
      #     redirect_to(new_spree_user_session_path)
      #   }
      #   format.js {
      #     render :json => { error: t('devise.failure.invalid') }, status: :unprocessable_entity
      #   }
      # end
    end

  end

  def destroy
   signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out_and_redirect(resource_name))
   set_flash_message! :notice, :signed_out if signed_out
   yield if block_given?
   respond_to_on_destroy
   spree_current_user = nil
 end

  private
    def accurate_title
      Spree.t(:login)
    end

    def redirect_back_or_default(default)
      redirect_to(session["spree_user_return_to"] || default)
      session["spree_user_return_to"] = nil
    end
end
