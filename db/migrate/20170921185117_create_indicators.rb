class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.string :name
      t.text :data

      t.timestamps null: false
    end
  end
end
