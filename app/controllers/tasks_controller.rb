class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find(task_id)
    if @task.nil?
      head :not_found
      return
    end
  end

  def new
    @task = Task.new
  end

  # No route matches {:action=>"show", :controller=>"tasks", :id=>nil}, possible unmatched constraints: [:id]
  def create
    @task = Task.new(
      # id: params[:task][:id],
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
      )
    if @task.save
      redirect_to task_path(@task.id)
      return
    else
      # do we need to redirect to make tests pass or render :new?
      render :new
      return
    end
  end


  # request checkbox checked (put)
  # update model, save to db
  # redirect user to reload another page
 # send to redirect to index, reload the whole thing
 # since model updated, re-render whole page

end
