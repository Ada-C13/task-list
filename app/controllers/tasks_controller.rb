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
    @task = Task.new(
      name: params[:task][:name], 
      description: params[:task][:description])

    if @task.save
      redirect_to tasks_path
    else
      render :new, :bad_request
    end
  end 


  def edit

  end 


  def update 

  end 


  def destroy

  end 



end