class RemoveDatumFromKpi < ActiveRecord::Migration
  def change
    remove_column :kpis, :datum, :integer
  end
end
