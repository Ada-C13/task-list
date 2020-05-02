class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id].to_i)
    redirect_to root_path if @task.nil?
    return
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description])
    @task.save ? (redirect_to action: "show", id: @task[:id]) : (render :new)
    return
  end
end
