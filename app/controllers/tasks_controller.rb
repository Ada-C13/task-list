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
    @task = Task.new
  end


  def create # send new task data to database
    
    @task = Task.new(title: params[:task][:title], description: params[:task][:description])
    if @task.save
      redirect_to tasks_path
      return
    else
      render :new
      return
    end

  end


  def edit # form to edit details for existing task
  end

  
  def update # send updated task to database
  end

  
  def destroy # get rid of a task
  end

end