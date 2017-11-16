class TodoItemsController < ApplicationController
	before_action :set_todo_list
	

	def create
		@todo_item = @todo_list.todo_items.create(todo_item_params)

		redirect_to @todo_list
	end

	# GET /todo_lists/1/edit
	 def edit
	 	@todo_item = @todo_list.todo_items.find(params[:id])
		    respond_to do |format|
		        format.html  #If it's a html request this line tell rails to look for new_release.html.erb in your views directory
		        format.js #If it's a js request this line tell rails to look for new_release.js.erb in your views directory
		      end
	 end

	def destroy
		@todo_item = @todo_list.todo_items.find(params[:id])
		if @todo_item.destroy
			flash[:success] = "Todo list item was deleted"
		else
			flash[:error] = "Todo list item could not be deleted"
		end
		redirect_to @todo_list
	end
	private

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def todo_item_params
		params[:todo_item].permit(:content, :deadline, :tag_list)
	end

end
