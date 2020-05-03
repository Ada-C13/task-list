class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy, :mark_complete]
  
  def index
    # so this won't change the order even after updating a task
    @tasks = Task.order(:id).all
  end

  def show
    # id = params[:id].to_i
    # @task = Task.find_by(id: id)

    if @task.nil?
      redirect_to tasks_path, notice: 'Task not found'
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
      #completed_at: params[:task][:completed_at]
    )
    respond_to do |format|
      if @task.save
        format.html { redirect_to task_path(id: @task.id), notice: 'Task was successfully created.' }
        #format.json { render :create, status: :created, location: @task }
        #redirect_to task_path(id: @task.id)
      else
        render :new, :bad_request
        return
        #format.html { render :new }
        #format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # id = params[:id].to_i
    # @task = Task.find_by(id: id)
  end

  def update
    # id = params[:id].to_i
    # @task = Task.find_by(id: id)
    if @task.nil?
      redirect_to task_path
    elsif
      respond_to do |format|
        if @task.update(
          name: params[:task][:name],
          description: params[:task][:description],
          #completed_at: params[:task][:completed_at]
        )
          format.html { redirect_to task_path(id: @task.id), notice: 'Task was successfully updated.' }
          #format.json { render :update, status: :ok, location: @task }
        else
          render :edit, :bad_request
          return
          #format.html { render :update }
          #format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    # id = params[:id].to_i
    # @task = Task.find_by(id: id)
    @task.destroy
    # redirect_to root_path
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Task was successfully removed.' }
      format.json { head :no_content }
    end
  end

  def mark_complete
    if @task.nil?
      head :not_found
      return
    elsif
      respond_to do |format|
        if @task.completed_at != '' && @task.completed_at != nil 
          @task.update(
            completed_at: nil
          )
          format.html { redirect_to task_path(id: @task.id), notice: 'Need some more time, I guess?' }
          #format.json { render :mark_complete status: :ok, location: @task }
        else 
          @task.update(
            completed_at: @task.updated_at
          )
          format.html { redirect_to task_path(id: @task.id), notice: 'YAY! Task Completed!' }
          #format.json { render :mark_complete, status: :ok, location: @task }
        end
      end
    end
    return
  end


  private
  # helper methods to help DRY up some codes
  def find_task
    id = params[:id].to_i
    @task = Task.find_by(id: id)
  end

end
