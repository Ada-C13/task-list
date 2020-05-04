class TasksController < ApplicationController
  # Controller Actions are always methods
  def home
  end
  
  # index is a method
  def index #index means to list all
    @tasks = Task.all
  end

  def show # get one task
    # special params hash
    # the id was passed into the route
    id = params[:id].to_i
    @task =  Task.find_by(id:id)

    if @task.nil?
      redirect_to tasks_path()
      return
    end

  end

  def update
  end

  def edit
  end

  def destroy
    @task = Task.destroy
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
      redirect_to tasks_path(@task.id) #go to "/tasks" so User can see the task in the list
      return
    else #the save has failed
      # render :new  - keeps all the values that were passed in
      # so User does not have to type the information again
      render :new, :bad_request #show the new task form view again
      return 
    end
  end
end

