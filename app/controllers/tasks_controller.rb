class TasksController < ApplicationController
  # Controller Actions are always methods
  # index is a method
  def index #index means to list all
    @tasks = Task.all
  end

  def show
    # special params hash
    # the id was passed into the route
    id = params[:id].to_i
    @task =  Task.find(id)

    if @task.nil?
      head :not_found
      return
    end
  end
end

