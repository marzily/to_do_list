class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def create
  end

  def new
  end

  def show
  end

  def destroy
  end
end
