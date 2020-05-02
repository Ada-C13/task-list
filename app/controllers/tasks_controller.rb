# TASKS = [
#   { name: "interview prep", description: "solving algorithms on leetcode"},
#   { name: "grocery shopping", description: "buy bread, banans and apples"},
#   { name: "practice rails", description: "read videos and code along"}
# ]

class TasksController < ApplicationController

  def index 
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end
  end


end
