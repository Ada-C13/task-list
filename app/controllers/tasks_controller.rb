class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
    return redirect_to :tasks if @task.nil?
  end

  def new 
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], completed_at: params[:task][:completed_at]) #instantiate a new book
    if @task.save 
      return redirect_to @task
    else
      render :new
      return
    end
  end

end
