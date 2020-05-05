class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end


  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      # head :not_found
      redirect_to tasks_path
      return
    end
    
  end


  def new
    @task = Task.new
  end


  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description]) # instantiate a new task
    
    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path(@task.id) 
      return
    else
      render :new, :bad_request # show the new task form view again
      return
    end
  end

  def edit
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      # head :not_found
      redirect_to tasks_path
      return
    end
    
  end

end
