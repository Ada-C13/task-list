class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id].to_i)
    redirect_to root_path if @task.nil?
  end

  def new
    @task = Task.new
  end
end
