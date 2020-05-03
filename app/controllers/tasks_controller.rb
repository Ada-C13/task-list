class TasksController < ApplicationController

  def index
    @tasks = Task.all.order(:id)
  end


  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
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
      description: params[:task][:description])

    if @task.save
      redirect_to task_path(@task.id)    #if form successfully saves, redirect to all tasks page
      return
    else
      render :new, :bad_request          #if form fails to save, back to form page with form fields filled in
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
    return head :not_found if @task.nil?

    if @task.update(                     #if form successfully updates/saves 
      name: params[:task][:name],
      description: params[:task][:description]
    )
      redirect_to task_path(@task.id)    #redirect to all tasks page
      return
    else
      render :edit, :bad_request         #if form fails to save, back to form page with form fields filled in
    end
  end


  # def remove
  #   @task = Task.find_by(id: params[:id])
  #   return head :not_found if @task.nil?
  # end


  def destroy
    @task = Task.find_by(id: params[:id])
    return head :not_found if @task.nil?

    if @task.destroy
      redirect_to tasks_path             #if successfully deleted, redirect to all tasks page
      return
    else
      render :remove, :bad_request       #if fails to delete, back to confirmation page
    end
  end


  def mark_complete
    @task = Task.find_by(id: params[:id])
    return head :not_found if @task.nil?

    if @task.completed_at == nil || @task.completed_at == ""
      @task.update(completed_at: Time.now)
    else
      @task.update(completed_at: nil)
    end

    redirect_to tasks_path
  end
end