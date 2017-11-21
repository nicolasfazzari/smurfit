class AddCategoryIdToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :category_id, :integer
  end
end
