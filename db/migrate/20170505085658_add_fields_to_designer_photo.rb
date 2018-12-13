class AddFieldsToDesignerPhoto < ActiveRecord::Migration[5.0]
  def up
    add_column :designer_photos, :hint, :string
    add_column :designer_photos, :url, :string
    add_column :designer_photos, :image, :string
    add_reference :designer_photos, :designer, foreign_key: true
  end
  def down
    remove_column :designer_photos, :hint
    remove_column :designer_photos, :url
    remove_column :designer_photos, :image
    remove_reference :designer_photos, :designer
  end
end
