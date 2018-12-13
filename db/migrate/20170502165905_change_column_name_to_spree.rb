class ChangeColumnNameToSpree < ActiveRecord::Migration[5.0]
  def change
    rename_column :spree_designers, :name, :lastname
  end
end
