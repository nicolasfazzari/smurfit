class CreateKpis < ActiveRecord::Migration
  def change
    create_table :kpis do |t|
      t.string :name
      t.integer :datum

      t.timestamps null: false
    end
  end
end
