# Tasks = [
#   {name: "Honey", description: "go swimming", completed_at: "Sunday evening"},
#   {name: "Calder", description: "do laundry", completed_at: "Monday night"},
#   {name: "Zoe", description: "plant flowers", completed_at: "Monday morning"},
#   {name: "Claire", description: "go to pure barre", completed_at: "yesterday miday"},
#   {name: "Darin", description: "fold cloth", completed_at: "2 min ago"},
#   {name: "Kyle", description: "High Five Somebody You Don't Know", completed_at: "a min ago"},
# ]

class TasksController < ApplicationController
  def index 
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id]) 

    if @task.nil?
      redirect_to root_path
      # head :not_found # you can also put 404 
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

  def edit
    @task = Task.find_by(id: params[:id]) 

    if @task.nil?
      redirect_to root_path
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
    else
      @task.completed_at = nil 
    end
      @task.save
      redirect_to root_path
  end

  def new
    @task = Task.new

  end

  def create
    @task = Task.new(task_params) #instantiate a new task
    if @task.save # save return true if the DB insert succeeds
      # redirect_to task_path # to to the index so we can see the task in the list
      redirect_to task_path(@task.id)
      return
    else # save filled :(
      render :new # show the new task form view again
      return
    end
  end

  private

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end

  
end
