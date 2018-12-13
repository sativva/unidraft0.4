module Spree
 class ConfirmationsController < Devise::ConfirmationsController
  def new
   super
  end

  def create
    super
  end

  def update
    super
  end

  def show
    super
  end

 protected

  def after_confirmation_path_for(resource_name, resource)
    if signed_in?
      signed_in_root_path(resource)
    else
      login_path
    end
  end
 end
end
