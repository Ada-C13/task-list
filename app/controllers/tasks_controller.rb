
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end


  def show
    id = params[:id]
    @task = Task.find_by(id:id)

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
      description: params[:task][:description], 
      completed_at: params[:task][:completed_at]) 
    if @task == nil?
      render :redirect
      return
    end

    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path(@task.id) # go to the index so we can see the task in the list
      return
    # elsif @task == false
    #   render :redirect
    #   return
    else # save failed :(
      render :new # should this be :redirect or :new
      return
    end
  end
end