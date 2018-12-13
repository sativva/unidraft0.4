class DropUniversPicsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :spree_designers, :univers_pics_file_name
    remove_column :spree_designers, :univers_pics_content_type
    remove_column :spree_designers, :univers_pics_file_size
    remove_column :spree_designers, :univers_pics_updated_at
  end
end



