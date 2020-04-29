TASKS = [
  {task: "Do dishes", date: "Today"},
  {task: "finish baseline", date: "Tomorrow"}
]
class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end

  def show
    id = params[:id].to_i
    @task = TASKS[id]

    if @task.nil?
      head :not_found
      return
    end

  end
end
