TASKS = [
    { task: "Task 1"},
    { task: "Task 2"},
    { task: "Task 3"}
  ]
class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
