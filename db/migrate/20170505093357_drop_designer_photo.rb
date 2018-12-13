class DropDesignerPhoto < ActiveRecord::Migration[5.0]
  def change
    drop_table :designer_photos
  end
end
