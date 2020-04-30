class TasksController < ApplicationController
  
  TASKS = [
    { description: "Wash hair"},
    { description: "Finish readings"},
    { description: "Make dinner"}
  ]
  
  def index
    @tasks = TASKS
  end
end
