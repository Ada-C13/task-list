
# TASKS = [
#   {name: "Review curriculum", description: "review textbook and videos"},
#   {name: "Grocery Run", description: "grocery run and buy avocados"},
#   {name: "Workout", description: "yoga or zumba"},
#   {name: "Project", description:"due 05/05"},
# ]

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end
  end

end
