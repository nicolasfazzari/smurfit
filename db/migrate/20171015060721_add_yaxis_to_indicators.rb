class AddYaxisToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :yaxis, :string
  end
end
