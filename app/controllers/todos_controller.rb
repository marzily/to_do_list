class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :destroy]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new_with_deadline(todo_params)

    if @todo.save
      redirect_to @todo, notice: 'ToDo was successfully created.'
    else
      render :new
    end
  end

  def show
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
