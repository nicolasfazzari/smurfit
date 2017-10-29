class AddTypeToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :type, :string
  end
end
