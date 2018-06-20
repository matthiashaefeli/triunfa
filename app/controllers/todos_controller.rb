class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def create
    todo = Todo.create(todo_params)
    redirect_to todos_path
  end

  def update
    if request.xhr?
      todo = Todo.find(params[:id])
      todo.done = false
      todo.save
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.delete
  end

  private

  def todo_params
    params.require(:todo).permit(:name)
  end

end
