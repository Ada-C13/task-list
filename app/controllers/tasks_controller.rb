TASKS = [
  'task 1',
  'task 2',
  'task 3'
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
