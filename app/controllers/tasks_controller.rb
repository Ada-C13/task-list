
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      redirect_to root_path
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params) #instantiate a new task

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
      redirect_to root_path
      return
    end
  end

  def update
    @task = Task.find_by(id: params[:id])
  if @task.nil?
    redirect_to root_path
    return
  elsif @task.update(task_params)
    redirect_to task_path(@task.id) # go to the index so we can see the task in the list
    return
  else # save failed :(
    render :edit # show the new task form view again
    return
  end
  end

  def destroy
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      redirect_to root_path
      return
    else
      @task.destroy
      redirect_to root_path
    end
  end

  def mark_complete
    @task = Task.find_by(id: params[:id])

    if @task.completed_at.nil?
      @task.completed_at = Date.today
    end

    @task.save
      
    redirect_to root_path
  end

  private

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end
end
