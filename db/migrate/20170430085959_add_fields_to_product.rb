class AddFieldsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_products, :date_of_sale, :date
    add_column :spree_products, :date_end_sale, :string
    add_column :spree_products, :min_sales_for_prod, :integer
    add_column :spree_products, :series_count, :integer
    add_reference :spree_products, :designer, foreign_key: true
    add_column :spree_products, :level, :string
  end
end


