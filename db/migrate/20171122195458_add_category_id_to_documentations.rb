class AddCategoryIdToDocumentations < ActiveRecord::Migration
  def change
    add_column :documentations, :category_id, :integer
  end
end
