class AddEfficiencyToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :efficiency, :string
  end
end
