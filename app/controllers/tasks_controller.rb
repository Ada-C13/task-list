TASKS = [
  { title: "Kids", description: "Get more workbooks"},
  { title: "Home", description: "Get more toothpaste"},
  { title: "Home", description: "Get coffee now"},
  { title: "Charlie", description: "Update shots"},
  { title: "Costco", description: "Toilet Paper"},
  { title: "Costco", description: "Chicken"},
]

class TasksController < ApplicationController
  
  def index
    @tasks = TASKS
  end
end
