class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end 

  def show 
    # raise
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil? 
      head :not_found  # it sends back an error code 404
      return
    end
  end 


  def new 
  end
end
