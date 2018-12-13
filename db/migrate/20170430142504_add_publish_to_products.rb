class AddPublishToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_products, :publish, :boolean
  end
end
