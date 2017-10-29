class AddGraphToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :graph, :string
  end
end
