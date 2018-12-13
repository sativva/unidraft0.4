class AddPhotosToDesginer < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_designers, :photos, :string
  end
end
