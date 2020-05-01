TASKS = [
  { assignee: "Jay", task: "wash the dishes"},
  { assignee: "Sarah", task: "wash the clothes"},
  { assignee: "Sam", task: "walk the dog"}
]

class ApplicationController < ActionController::Base
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
      completed_at: params[:task][:completed_at], 
      description: params[:task][:description]
    ) 

    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path(@task.id)
      return
    else # save failed :(
      render :new # show the new book form view again
      return
    end

  end

end
