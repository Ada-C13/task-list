TASKS = [
  { task: "Dishes", person: "Chelsea"},
  { task: "Laundry", person: "Justin"},
  { task: "Sweep", person: "Huxley"}
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
