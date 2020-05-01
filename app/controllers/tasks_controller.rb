
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      redirect_to tasks_path
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      name: params[:task][:name], 
      description: params[:task][:description]) #instantiate a new task

    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path(@task.id) # go to the show so we can see the new task
      return
    else # save failed :(
      render :new, :bad_request # show the new task form view again, return bad request
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

  def update
    @task = Task.find_by(id: params[:id])
  if @task.nil?
    head :not_found
    return
  elsif @task.update(
    name: params[:task][:name], 
    description: params[:task][:description])
    redirect_to tasks_path # go to the index so we can see the task in the list
    return
  else # save failed :(
    render :edit # show the new task form view again
    return
  end
  end

  def destroy
  end
end
