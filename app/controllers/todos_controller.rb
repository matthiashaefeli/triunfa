# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :logged_in
  def index
    @todos = Todo.where(user: current_user)
  end

  def create
    todo = Todo.create(todo_params)
    todo.user = current_user
    todo.save
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
