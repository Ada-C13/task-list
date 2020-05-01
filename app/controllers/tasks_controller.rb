# TASKS = [
#   {name: 'clean the house', description: 'kitchen, bedroom, bathroom and wash dishes', complete_at: 'time'}, 
#   {name: 'homework', description: 'cs-fun, finish project and Exercism: Roman Numeral Converter', complete_at: 'time'},
#   {name: 'yoga', description: '10 min of yoga before class', complete_at: 'time'}
# ]

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
  
  def update 
  end 
  
  def edit 
  end 
  
  def destroy
  end 
  
  def new
    @task = Task.new
  end 
  
  def create 
    get_task = params[:task]
    task = Task.new(
      
      name: get_task[:name],
      description: get_task[:description]
      
    )
    if book.save
      redirect_to tasks_path #send them to the '/tasks' path
    end 
    
  end
  