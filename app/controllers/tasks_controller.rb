# TASKS = [
#   { name: "interview prep", description: "solving algorithms on leetcode"},
#   { name: "grocery shopping", description: "buy bread, banans and apples"},
#   { name: "practice rails", description: "read videos and code along"}
# ]

class TasksController < ApplicationController

  def index 
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      # head :not_found
      # redirect instead of :not found to pass the test
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
      description: params[:task][:description],
      completed_at: params[:task][:completed_at])
    
    if @task.save
      redirect_to task_path(@task.id)
      return
    else
      render :new, :bad_request
      return
    end
  end

  def edit 
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end
  end

  def update 
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end

    @task.update(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )

    if @task.save
      redirect_to task_path(@task.id)
      return
    else
      render :new, :bad_request
      return
    end
  end

  def confirm_delete
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

  end

  def destroy
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end

    @task.destroy

    redirect_to tasks_path 
  end

end
