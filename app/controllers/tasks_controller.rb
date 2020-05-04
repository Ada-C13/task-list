# TASKS = %w[task1 task2 task3 task4].freeze

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:id)
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
      description: params[:task][:description]
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
      description: params[:task][:description]
    )
      redirect_to task_path(@task.id) 
      return
    else # save failed :(
      render :edit
      return
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.destroy
      redirect_to tasks_path
      return
    else 
      render :show
      return
    end
  end

  def complete
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task[:completed_at].nil?
      @task.update(
      completed_at: Time.now
    )
      redirect_to tasks_path 
      return
    elsif !@task[:completed_at].nil?
      @task.update(
      completed_at: nil
    )
      redirect_to tasks_path 
      return
    else 
      render :index
      return
    end
  end

end
