TASKS = [
  {name: 'clean the house', description: 'kitchen, bedroom, bathroom and wash dishes', complete_at: 'time'}, 
  {name: 'homework', description: 'cs-fun, finish project and Exercism: Roman Numeral Converter', complete_at: 'time'},
  {name: 'yoga', description: '10 min of yoga before class', complete_at: 'time'}
]

class TasksController < ApplicationController
  def index 
    @tasks = TASKS
  end 
  
  def show #id does not have to be a number, by default is a string 
    id = params[:id].to_i
    @task = TASKS[id]
    
    if @task.nil?
      head :not_found
      return 
    end 
  end 
end
