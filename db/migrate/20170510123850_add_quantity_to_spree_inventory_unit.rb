class AddQuantityToSpreeInventoryUnit < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_inventory_units, :quantity, :integer
  end
end
