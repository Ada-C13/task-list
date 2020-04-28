TASKS = [
  {title: "Do dishes", date: "Today"},
  {title: "finish baseline", date: "Tomorrow"}
]
class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
