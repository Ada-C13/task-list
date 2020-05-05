class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    redirect_to tasks_path if @task.nil?
  end
  
  def new
    @task = Task.new
  end

  def create 
    @new_task = Task.new(
      name: params[:task][:name], 
      description: params[:task][:description], 
      completed_at: "incomplete",
    )

    if @new_task.save
      redirect_to task_path( @new_task.id )
    else
      render new_task_path 
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
    redirect_to tasks_path if @task.nil?
  end

  def update
    task = Task.find_by(id: params[:id])

    if task.nil?
      redirect_to root_path
    elsif task.update(task_params)
      redirect_to task_path(task.id)
    else
      render new_task_path
    end
  end

  def destroy
    task = Task.find_by(id: params[:id])

    if task.nil?
      redirect_to tasks_path
    elsif task.destroy
      redirect_to tasks_path
    else
      render tasks_path
    end
  end

  def toggle_completed
    task = Task.find_by(id: params[:id])

    if task.nil?
      redirect_to root_path
   elsif @task.update(
      completed_at: Time.now.strftime("%B %e, %Y at %I:%M %p")
    )
    else
      redirect_to tasks_path
    end
  end


  private

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end

end
