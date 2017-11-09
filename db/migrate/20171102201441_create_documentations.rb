class CreateDocumentations < ActiveRecord::Migration
  def change
    create_table :documentations do |t|
      t.string :format
      t.string :title
      t.integer :version

      t.timestamps null: false
    end
  end
end
