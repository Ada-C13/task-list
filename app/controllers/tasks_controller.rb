TASKS = [
  {name:"Task One", description: "Complete reading lessons"},
  {name:"Task Two", description: "Complete Exercises"},
  {name:"Task Three", description: "Work on the project"},
  {name:"Task Four", description: "Spend at least an hour working on CS Fundamental"}
]


class TasksController < ApplicationController
  # Create an index method to show the list of all tasks
  def index 
    @tasks = TASKS
  end
end
