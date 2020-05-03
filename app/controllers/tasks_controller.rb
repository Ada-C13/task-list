# TASKS = [
#   {name:"Task One", description: "Complete reading lessons"},
#   {name:"Task Two", description: "Complete Exercises"},
#   {name:"Task Three", description: "Work on the project"},
#   {name:"Task Four", description: "Spend at least an hour working on CS Fundamental"}
# ]


class TasksController < ApplicationController
  # Create an index method to show the list of all tasks
  def index 
    @tasks = Task.all.order(:created_at)
  end

  # Create a show method to show only one particular task
  def show
    @task = Task.find_by(id: params[:id].to_i)
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end 

  # Create a new method to display a form for adding a new task 
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      name:params[:task][:name],
      description: params[:task][:description]
    )
    if @task.save
      redirect_to task_path(@task.id) # redirect the user to the list of tasks so they can see if the new task is added
    else
      render :new, :bad_request
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
      description: params[:task][:description]
    )
      
      redirect_to task_path # go to the list of task so we can see the index
      
      return
    else # save failed
      render :edit # show the new task from the view again
      return
    end
  end 

  def delete
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    end
    @task.destroy

    redirect_to tasks_path
    return
  end

  def mark_complete 
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    end
    # Update the database with the task's completed_at date
    if @task.completed_at == nil
      @task.update(completed_at: Time.now.to_s)
      redirect_to tasks_path
      return
    else 
      @task.update(completed_at: nil)
      redirect_to tasks_path
      return
    end   
  end
end
