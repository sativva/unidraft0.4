class AddAvatarToSpreeDesigner < ActiveRecord::Migration[5.0]
  def change
    def up
      add_attachment :spree_designers, :avatar
      add_attachment :spree_designers, :video
      add_attachment :spree_designers, :univers_pics
    end

    def down
      add_attachment :spree_designers, :avatar
      add_attachment :spree_designers, :video
      add_attachment :spree_designers, :univers_pics
    end
  end
end
