TASKS = [
  {task: "Do dishes", date: "Today"},
  {task: "finish baseline", date: "Tomorrow"}
]
class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
