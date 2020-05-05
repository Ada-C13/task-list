class TasksController < ApplicationController
  def index 
    @tasks = Task.all
  end 
  
  def show #id does not have to be a number, by default is a string 
    id = params[:id].to_i
    @task = Task.find_by(id: id) 
    
    if @task.nil?
      head :not_found
      return 
    end 
  end 
  
  def edit 
    @task = Task.find_by(id: params[:id])
    
    if @task.nil?
      head :not_found
      return
    end
  end 
  
  def update #Send form data to the server to update an existing book
    @task = Task.find_by(id: params[:id])
    
    if @task.nil? 
      head :not_found
      return 
    elsif @task.update(task_params) 
      redirect_to task_path
      return 
    else 
      render :edit
      return   
    end  
  end 
  
  
  def new
    @task = Task.new
  end 
  
  def create 
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else 
      render :new, :bad_request
    end 
  end 
  
  
  def complete
    @task = Task.find_by(id: params[:id])
    if @task.nil? 
      head :not_found
      return 
    elsif @task.completed_at == ""
      @task.update(completed_at: Time.now) 
      redirect_to tasks_path
      return 
    else 
      @task.update(completed_at: "")
    end 
  end 
  
  def destroy
    @task = Task.find_by(id: params[:id])
    
    if @task.nil? 
      head :not_found
      return 
    end 
    @task.destroy
    redirect_to tasks_path
    return  
  end
  private 
  
  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end 
end 
