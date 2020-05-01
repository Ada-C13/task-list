TASKS = [
  { assignee: "Jay", task: "wash the dishes"},
  { assignee: "Sarah", task: "wash the clothes"},
  { assignee: "Sam", task: "walk the dog"}
]

class ApplicationController < ActionController::Base
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.all[task_id]
    if @task.nil?
      head :not_found
      return
    end
  end
end
