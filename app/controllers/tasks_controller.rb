# TASKS = %w[task1 task2 task3 task4].freeze

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    id = params[:id].to_i
    # @task = Task.find(id) #this returns a Record not fount instead of a nil for an invalid id
    @task = Task.find_by(id: id)
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    # raise
    # "task"=>{"name"=>"boo", "description"=>"bi", "completed_at"=>"boo"},
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )

    if @task.save
      redirect_to task_path(@task.id)
    else
      render :new, :bad_request # show the new task form view again
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
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )
      redirect_to task_path(@task.id) 
      return
    else # save failed :(
      render :edit
      return
    end
  end

end
