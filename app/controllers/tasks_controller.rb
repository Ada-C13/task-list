# TASKS = [
#   { name: "Task 1", description: "Do the laundry", completed_at: "20th Mar"},
#   { name: "Task 2", description: "Watch all rails videos", completed_at: "1st Apr"},
#   { name: "Task 3", description: "Do dinner", completed_at: '2nd Feb'}
#   ]

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
end
