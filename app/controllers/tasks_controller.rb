TASKS = [
  {
    name: "Task One"
  },
  {
    name: "Task Two"
  },
  {
    name: "Task Three"
  },
]

class TasksController < ApplicationController

  def index
    @tasks = TASKS
  end
end
