class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    if @task.nil?
      head :not_found
      return
    end
  end

  def new
    @task = Task.new
    render :new
  end 

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description]) #instantiate a new task
    if @task.save # save returns true if the database insert succeeds
      redirect_to tasks_path # go to the index so we can see the book in the list
      return
    else # save failed :(
      render :new # show the new book form view again
      return
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end





end
