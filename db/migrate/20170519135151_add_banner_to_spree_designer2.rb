class AddBannerToSpreeDesigner2 < ActiveRecord::Migration[5.0]
  def up
    add_attachment :spree_designers, :banner
  end

  def down
    add_attachment :spree_designers, :banner
  end
end
