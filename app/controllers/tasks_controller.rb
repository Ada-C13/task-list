class TasksController < ApplicationController
  # Controller Actions are always methods
  # index is a method
  def index #index means to list all
    @tasks = Task.all
  end

  def show
    # special params hash
    # the id was passed into the route
    task_id = params[:task_id].to_i
    @task =  Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end
  end

  def new
    # rendering the form
    @task = Task.new
  end

  def create
    # backend work and save
    # instantiate a new task
    @task = Task.create(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    ) 
    if @task.save #returns true if the db insert succeeds
      redirect_to tasks_path #go to "/tasks" so User can see the task in the list
      return
    else #the save has failed
      # render :new  - keeps all the values that were passed in
      # so User does not have to type the information again
      render :new, :bad_request #show the new task form view again
      return 
    end
  end

  def destroy
    @task = Task.destroy
  end

  
end

