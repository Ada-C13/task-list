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

  def edit
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      # head brings back to index
      head :not_found
      return
    end
  end


  def update
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      name: params[:task][:name], 
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )
      redirect_to task_path(@task.id) # go to show page for id
      return
    else
      render :edit # show the new form view again
      return
    end
  end

  def destroy
    task = Task.find_by(id: params[:id])
    if task.nil?
      head :not_found
      return
    else
      task.destroy
      redirect_to tasks_path
    end
  end


  # request checkbox checked (put)
  # update model, save to db
  # redirect user to reload another page
 # send to redirect to index, reload the whole thing
 # since model updated, re-render whole page

end
