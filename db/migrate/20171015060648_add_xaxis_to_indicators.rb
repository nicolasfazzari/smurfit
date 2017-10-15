class AddXaxisToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :xaxis, :string
  end
end
