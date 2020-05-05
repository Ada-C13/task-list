require "date"

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new name: params[:task][:name], description: params[:task][:description], completed_at: params[:task][:completed_at]

    if task.save
      redirect_to task_path(task.id)
    else
      render :new, :bad_request
    end
  end

  def edit
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
    else
      @task.name = @task[:name]
      @task.description = @task[:description]
      @task.completed_at = @task[:completed_at]
    end
  end

  def update
    # raise
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
    else
      @task[:name] = params[:task][:name]
      @task[:description] = params[:task][:description]
      @task[:completed_at] = params[:task][:completed_at]
      if @task.save
        redirect_to task_path(@task.id)
        return
      else
        render :new, :bad_request
        return
      end
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    else
      @task.destroy
      redirect_to "/tasks"
    end
  end

  def mark_complete
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
    else
      if @task[:completed_at].empty?
        @task[:completed_at] = Date.today.to_s
      end
      if @task.save
        redirect_to "/tasks"
        return
      else
        render :new, :bad_request
        return
      end
    end
  end
end
