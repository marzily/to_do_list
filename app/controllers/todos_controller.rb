class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new_with_deadline(todo_params)

    if @todo.save
      redirect_to @todo
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @todo.update(completed: params[:completed])
    redirect_to todos_path
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:task, :deadline, :completed, :more_details)
    end
end
