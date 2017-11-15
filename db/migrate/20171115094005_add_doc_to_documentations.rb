class AddDocToDocumentations < ActiveRecord::Migration
  def change
    add_column :documentations, :doc, :string
  end
end
