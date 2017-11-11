class AddProcessToDocumentations < ActiveRecord::Migration
  def change
    add_column :documentations, :process, :string
  end
end
