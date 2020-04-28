TASKS = [
  {name:"clean the dishes"},
  {name:"check email"},
  {name:"practice interview questions"}
]


class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end 
end
