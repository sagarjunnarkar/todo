class TodosController < ApplicationController
  def index
    @todo_items = Todo.all
    @new_todo = Todo.new
  end

  def add
    @todo = Todo.create(:name => params[:todo][:name])
    if @todo.valid?
      flash.now[:success] = "Todo added successfully"  
    else
      flash.now[:error] = @todo.errors.full_messages.join("<br>").html_safe
    end
    render 'add'
  end

  def complete
    params[:todos_checkbox].each do |check|
       todo_id = check
       t = Todo.find_by_id(todo_id)
       if t.completed == true
         t.update_attribute(:completed, false)
       else
         t.update_attribute(:completed, true)
       end
     end
    redirect_to :action => 'index'
 end  

  def mark
  end

  def unmark
  end

  def delete
  end
end
