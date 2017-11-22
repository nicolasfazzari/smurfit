class AddPriorityToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :priority, :string
  end
end
