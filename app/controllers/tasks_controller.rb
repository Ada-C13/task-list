# TASKS = [
#   {todo: "more hello", text: "more stuff"},
#   {todo: "no hello", text: "more stuff"}
# ]

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end


  def show
    task_id = params[:id].to_i # this special params variable lets us get info that has been passed in to the controller
    @task = Task.find_by(id: task_id)  # in this case it is the id that has been passed in through the route
    
    if @task.nil?
      head :not_found
      return
    end
  end
  
end
