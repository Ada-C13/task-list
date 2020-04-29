TASKS = [
  { name: "Finish wave 1", description: "Work on the task-list project wave 1", completed_at: "April, 28, 2020" },
  { name: "Attend the Zulily meeting", description: "Attend and take notes from the Zulily company meeting", completed_at: "April, 28, 2020" },
  { name: "Leg workout", description: "Do 45-60 mins of physical therapy leg workout for left leg", completed_at: "April, 28, 2020" },
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end

  def show
    id = params[:id].to_i
    @task = TASKS[id]

    if @task.nil?
      head :redirect
      return
    end
  end
end
