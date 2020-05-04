TASKS = [
  {name: "clean", description: ""},
  {name: "wash dishes", description: ""}
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
