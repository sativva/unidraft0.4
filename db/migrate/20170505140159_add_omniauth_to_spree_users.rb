class AddOmniauthToSpreeUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_users, :provider, :string
    add_column :spree_users, :uid, :string
    add_column :spree_users, :facebook_picture_url, :string
    add_column :spree_users, :first_name, :string
    add_column :spree_users, :last_name, :string
    add_column :spree_users, :token, :string
    add_column :spree_users, :token_expiry, :datetime
  end
end
