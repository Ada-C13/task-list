TASKS = [
  {name: 'Laundry'}, 
  {name: 'Fold laundry'}, 
  {name: 'Clean kitchen'} 
]
class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
