 TASKS = [
  { name: "Task_one", description: "To do something", completed_at: "time"},
  { name: "Task_one", description: "To do something", completed_at: "time"},
  { name: "Task_one", description: "To do something", completed_at: "time"},
  { name: "Task_one", description: "to do something", completed_at: "time"},
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
