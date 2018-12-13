module Spree
  class User < ActiveRecord::Base
    include Core::UserAddress
    include Core::UserPaymentSource
    devise :database_authenticatable, :registerable, :recoverable,
           :rememberable, :trackable, :validatable, :encryptable, :encryptor => 'authlogic_sha512'


    has_many :orders

    before_validation :set_login
    before_destroy :check_completed_orders

    users_table_name = User.table_name
    roles_table_name = Role.table_name
    acts_as_voter
    acts_as_follower
    scope :admin, -> { includes(:spree_roles).where("#{roles_table_name}.name" => "admin") }

    class DestroyWithOrdersError < StandardError; end

    def self.admin_created?
      User.admin.count > 0
    end

    def admin?
      has_spree_role?('admin')
    end

    def self.find_for_facebook_oauth(auth)
      user_params = auth.slice(:provider, :uid)
      user_params.merge! auth.info.slice(:email, :first_name, :last_name)
      user_params[:facebook_picture_url] = auth.info.image
      user_params[:token] = auth.credentials.token
      user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
      user_params = user_params.to_h

      user = User.where(provider: auth.provider, uid: auth.uid).first
      user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
      if user
        user.update(user_params)
      else
        user = User.new(user_params)
        user.password = Devise.friendly_token[0,20]  # Fake password for validation
        user.save
      end

      return user
    end

    protected
      def password_required?
        !persisted? || password.present? || password_confirmation.present?
      end

    private

      def check_completed_orders
        raise DestroyWithOrdersError if orders.complete.present?
      end

      def set_login
        # for now force login to be same as email, eventually we will make this configurable, etc.
        self.login ||= self.email if self.email
      end
  end
end

