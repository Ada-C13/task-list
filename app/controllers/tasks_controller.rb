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
    id = params[:id].to_i
    @task = Task.find_by(id: id)
  
    if @task.nil?
      head :not_found
      return
    end
  end 


  def update 
    id = params[:id].to_i
    @task = Task.find_by(id: id)
    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      name: params[:task][:name], 
      description: params[:task][:description],
    )
      redirect_to tasks_path 
      return
    else
      render :edit 
      return
    end
  end 


  def destroy
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      head :not_found
      return
    end
    
    @task.destroy
    redirect_to tasks_path 
    return
  end 

  def mark_complete
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      completed_at: Time.now
    )
      redirect_to tasks_path 
      return
    else 
      render :index
    end
  end


end