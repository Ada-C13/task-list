TASKS = [
  { name: "Kids", description: "Get more workbooks", completed_at: DateTime.now},
  { name: "Home", description: "Get more toothpaste"},
  { name: "Home", description: "Get coffee now"},
  { name: "Charlie", description: "Update shots"},
  { name: "Costco", description: "Toilet Paper"},
  { name: "Costco", description: "Chicken"},
]



class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
end
