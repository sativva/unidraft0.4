module Spree
  module Admin
    class DesignersController < ResourceController
      # helper 'spree/products'

      # before_action :load_data, except: :index
      # create.before :create_before
      # update.before :update_before
      # helper_method :clone_object_url

      # def show
      #   session[:return_to] ||= request.referer
      #   redirect_to action: :edit
      # end

      def index
        @designers = Spree::Designer.all
        # session[:return_to] = request.url
        # respond_with(@collection)
      end




            def show
              redirect_to edit_admin_designer_path(@designer)
            end

            def new

            end

            def create
              @designer = Spree::Designer.new(designer_params)
              @designer.photos = params['designer']['photos']
              if @designer.save
                flash.now[:success] = flash_message_for(@designer, :successfully_created)
                render :edit
              else
                render :new
              end
            end

            def edit

            end

            def update
              # if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
              #   params[:user].delete(:password)
              #   params[:user].delete(:password_confirmation)
              # end

              if @designer.update_attributes(designer_params)
                @designer.photos = params['designer']['photos']
                @designer.save
                flash.now[:success] = Spree.t(:account_updated)
              end

              render :edit
            end

            # def addresses
            #   if request.put?
            #     if @user.update_attributes(user_params)
            #       flash.now[:success] = Spree.t(:account_updated)
            #     end

            #     render :addresses
            #   end
            # end

            # def orders
            #   params[:q] ||= {}
            #   @search = Spree::Order.reverse_chronological.ransack(params[:q].merge(user_id_eq: @user.id))
            #   @orders = @search.result.page(params[:page])
            # end

            # def items
            #   params[:q] ||= {}
            #   @search = Spree::Order.includes(
            #     line_items: {
            #       variant: [:product, { option_values: :option_type }]
            #     }).ransack(params[:q].merge(user_id_eq: @user.id))
            #   @orders = @search.result.page(params[:page])
            # end

            # def generate_api_key
            #   if @user.generate_spree_api_key!
            #     flash[:success] = Spree.t('api.key_generated')
            #   end
            #   redirect_to edit_admin_user_path(@user)
            # end

            # def clear_api_key
            #   if @user.clear_spree_api_key!
            #     flash[:success] = Spree.t('api.key_cleared')
            #   end
            #   redirect_to edit_admin_user_path(@user)
            # end

            # def model_class
            #   Spree.user_class
            # end

            # protected

            #   def collection
            #     return @collection if @collection.present?
            #     @collection = super
            #     @search = @collection.ransack(params[:q])
            #     @collection = @search.result.page(params[:page]).per(Spree::Config[:admin_users_per_page])
            #   end

            private

            def designer_params
              params.require(:designer).permit(
                :lastname,
                :givenname,
                :school,
                :linkedin,
                :instagram,
                :facebook ,
                :website,
                :profilepic,
                :universpics,
                :interview,
                :universvid,
                :avatar,
                :banner,
                :video,
                photos: []
                )
            end

            # handling raise from Spree::Admin::ResourceController#destroy
            # def user_destroy_with_orders_error
            #   invoke_callbacks(:destroy, :fails)
            #   render status: :forbidden, text: Spree.t(:error_user_destroy_with_orders)
            # end

            # def sign_in_if_change_own_password
            #   if try_spree_current_user == @user && @user.password.present?
            #     sign_in(@user, event: :authentication, bypass: true)
            #   end
            # end



    end
  end
end
