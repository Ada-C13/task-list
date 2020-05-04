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
  
  def edit #form to edit 
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
    elsif @task.update(name: params[:task][:name], description: params[:task][:description]) 
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
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: nil 
    )
    if @task.save
      redirect_to tasks_path #send them to the '/tasks' path
    else 
      render :new, :bad_request
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
  #when user clicks 'mark as complete', it should change the data base with the date it completed 
end 
