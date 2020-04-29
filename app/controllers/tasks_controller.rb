TASKS = [
  {task_name: "Grocery shopping"},
  {task_name: "cooking"},
  {task_name: "water flowers"},
]


class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
