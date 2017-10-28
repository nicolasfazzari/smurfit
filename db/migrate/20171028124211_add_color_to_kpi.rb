class AddColorToKpi < ActiveRecord::Migration
  def change
    add_column :kpis, :color, :string
  end
end
