class TasksController < ApplicationController
  
  def index
    @tasks = Task.all.order(:id)
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
    @task = Task.new(name: params[:task][:name], description: params[:task][:description])
    
    if @task.save
      redirect_to tasks_path
      return
    else
      render :new
      return
    end
    
  end
  
  
  def edit # form to edit details for existing task
    
    id = params[:id]
    @task = Task.find_by(id: id)
    
    if @task.nil?
      head :not_found
      return
    end
    
  end
  
  
  def update # send updated task to database
    
    id = params[:id]
    @task = Task.find_by(id: id)
    
    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      name: params[:task][:name], 
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
      )
      redirect_to tasks_path
      return
    else 
      render :edit
      return
    end

  end

  def destroy # get rid of a task
     
    id = params[:id]
    @task = Task.find_by(id: id)

    if @task.nil?
      redirect_to tasks_path
      return
    end

    @task.destroy
    redirect_to tasks_path
  end

  def mark_complete
    id = params[:id]
    @task = Task.find_by(id: id)

    if @task.nil?
      head :not_found
      return
    else @task.completed_at = Time.now
      @task.save
      redirect_to tasks_path
      return
    end

  end

  def mark_incomplete
    id = params[:id]
    @task = Task.find_by(id: id)

    if @task.nil?
      head :not_found
      return
    else @task.completed_at = nil
      @task.save
      redirect_to tasks_path
      return
    end

  end

end