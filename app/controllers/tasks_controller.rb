class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end


  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      head :not_found
      return
    end
    
  end


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description]) # instantiate a new task
    
    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path(@task.id) # go to the index so we can see the new task in the list
      return
    else # save failed :(
      render :new # show the new task form view again
      return
    end
  end

end
