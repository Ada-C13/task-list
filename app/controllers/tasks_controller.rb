class TasksController < ApplicationController

  TASKS = [
    { name: "Learn Ruby", description: "Do Task List Project and read lecture notes"},
    { name: "Grocery shopping", description: "Buy milk, eggs, and vegetables"},
    { name: "Call mom", description: "Wish her happy birthday"}
  ]

  def index
    @tasks = TASKS
  end

  
end
