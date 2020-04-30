class TasksController < ApplicationController
  TASKS = [
    {task: 'clean room', completed: 'false'},
    {task: 'make dinner', completed: 'false'},
    {task: 'kiss girlfriend', completed: 'true'}
  ]
  def index
    @tasks = TASKS
  end
end
