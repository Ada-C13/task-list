
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end


  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      redirect_to tasks_path
      # head :not_found
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      name: params[:task][:name], 
      description: params[:task][:description], 
      completed_at: params[:task][:completed_at]) 
    if @task == nil?
      render :redirect
      return
    end

    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path(@task.id) # go to the index so we can see the task in the list
      return
    else # save failed :(
      render :new # should this be :redirect or :new
      return
    end
  end

  def update
    @task = Task.find_by(id: params[:id])
    #@task.name = params[:task][:name]   
    # @task.description = params[:task][:description]
    # @task.completed_at = params[:task][:completed_at]

    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      name: params[:task][:name], 
      description: params[:task][:description], 
      completed_at: params[:task][:completed_at]
    )
      redirect_to task_path # go to the task show page not in the list
      return
    else # save failed where did we save? did update do it?
      render :edit # show the edit task form view again
      return
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  
    if @task.nil?
      head :not_found
      return
    end
  end

  def destroy
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    if @task.nil?
      head :not_found #return a 404
      return
    else 
      @task.destroy
      redirect_to tasks_path
    end
  end


end