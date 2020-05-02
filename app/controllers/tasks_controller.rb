class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # book_id = params[:id].to_i
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    end
  end
end
