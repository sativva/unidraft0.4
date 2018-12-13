class CreateSpreeDesigners < ActiveRecord::Migration[5.0]
  def change
      create_table :spree_designers do |t|
        t.string :name
        t.string :givenname
        t.string :school
        t.string :linkedin
        t.string :instagram
        t.string :facebook
        t.string :website
        t.string :profilepic
        t.string :universpics
        t.string :interview
        t.string :universvid

        t.timestamps
      end
    end
end
