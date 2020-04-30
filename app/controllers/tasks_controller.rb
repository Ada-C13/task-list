# TASKS = [
#   {name:"clean the dishes"},
#   {name:"check email"},
#   {name:"practice interview questions"}
# ]


class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end 

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id )

    if @task.nil? 
      redirect_to tasks_path
      return 
    end 

  end 

  def new 
  end 

  def create
  end 

end
