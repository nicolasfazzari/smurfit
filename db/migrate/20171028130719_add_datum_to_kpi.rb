class AddDatumToKpi < ActiveRecord::Migration
  def change
    add_column :kpis, :datum, :string
  end
end
