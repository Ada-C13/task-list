class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end

  def show
    id = params[:id]
    @task = Task.find_by(id: id)

    if @task.nil?
      head :not_found
      return
    end

  end
  
  def new # form to add a new task
  end

  def create # send new task data to database
  end

  def edit # form to edit details for existing task
  end

  def update # send updated task to database
  end

  def destroy # get rid of a task
  end
end