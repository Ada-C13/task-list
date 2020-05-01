
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
      redirect_to tasks_path
      return
    end
  end


  def new
    @task = Task.new
  end


  def create
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at])

    if @task.save
      redirect_to task_path(@task.id)        #if form successfully saves, redirect to all tasks page
    else
      render :new, :bad_request     #if form fails to save, back to form page with form fields filled in
    end
  end

  
  def edit
  end

  def update
  end

  def destroy
  end

end
