TASKS = [
  {
    todo: "Finish Task List project Wave 1"
  },
  {
    todo: "Buy dahlia tubers"
  },
  {
    todo: "Made dinner"
  }
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
