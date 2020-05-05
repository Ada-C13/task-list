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
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      redirect_to tasks_path
      return
    end
    
  end

  
  def update
    @task = Task.find_by(id: params[:id])
   
    if @task.nil?
      redirect_to tasks_path
      return
    elsif @task.update(name: params[:task][:name], description: params[:task][:description]) # update task
      redirect_to task_path(@task.id)
      return
    else
      render :edit
      return
    end
  end


  def destroy
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      redirect_to tasks_path
      return
    end

    @task.destroy

    redirect_to tasks_path
    return

  end


  def mark_complete
    @task = Task.find_by(id: params[:id])
   
    if @task.nil?
      redirect_to tasks_path
      return
    elsif @task.update(completed_at: Time.now) # update task
      redirect_to task_path(@task.id)
      return
    else
      render :edit
      return
    end
  end

end
