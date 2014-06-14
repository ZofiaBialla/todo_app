class TodosController < ApplicationController
  def index
  	 @todo_items = Todo.all
  	 @new_todo = Todo.new
  end

  def add
   todo = Todo.create(:todo_item => params[:todo][:todo_item])

    unless todo.valid?
     flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    else
     flash[:success] = "Todo item added successfully"   
    end 

  redirect_to :action => 'index'

  end

  def delete
    Todo.last.delete
    redirect_to :action => 'index'
  end 

end
