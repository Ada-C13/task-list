# TASKS = [
#   {task_name: "Grocery shopping"},
#   {task_name: "cooking"},
#   {task_name: "water flowers"},
# ]


class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find_by(id: params[:id])
    # @task = Task.find(params[:id])
    @task = Task.find_by(id: params[:id])
    # task_id = params[:id]
    # @task = Task.find_by(id: task_id)
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    # take in the user inputs
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: nil,
    )

    if @task.save
      redirect_to task_path(@task.id)
    else
      render :new
    end
  end

  def edit
    # find the task using id
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
    elsif
      @task.update(
        name: params[:task][:name],
        description: params[:task][:description],
        # TODO: set a button on the index.html.erb to mark completed
        completed_at: nil,
      )
      redirect_to task_path
      return
    else
      render :edit
      return
    end
  end

end
