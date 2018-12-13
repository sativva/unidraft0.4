class DropDesigner < ActiveRecord::Migration[5.0]
  def change
    drop_table :designers, force: :cascade
  end
end
