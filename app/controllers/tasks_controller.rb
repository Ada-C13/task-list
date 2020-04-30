TASKS = [
  { name: "Finish wave 1", description: "Work on the task-list project wave 1", completed_at: "April, 28, 2020" },
  { name: "Attend the Zulily meeting", description: "Attend and take notes from the Zulily company meeting", completed_at: "April, 28, 2020" },
  { name: "Leg workout", description: "Do 45-60 mins of physical therapy leg workout for left leg", completed_at: "April, 28, 2020" },
]

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :temporary_redirect
      return
    end
  end
end
