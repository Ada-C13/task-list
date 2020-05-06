# TASKS = [
#   { name: "Kids", description: "Get more workbooks", completed_at: DateTime.now},
#   { name: "Home", description: "Get more toothpaste"},
#   { name: "Home", description: "Get coffee now"},
#   { name: "Charlie", description: "Update shots"},
#   { name: "Costco", description: "Toilet Paper"},
#   { name: "Costco", description: "Chicken"},
# ]



class TasksController < ApplicationController
  # https://stackoverflow.com/a/34252150
  skip_before_action :verify_authenticity_token
  def index
    @tasks = Task.all #Task is pulling data from the Tasks table in our database
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by_id(task_id)
   if @task.nil?
      #redirect_to :action => 'index'
      head :not_found
      return   
    end
  end

  # POST /tasks
  # how to use it with postman https://medium.com/@oliver.seq/creating-a-rest-api-with-rails-2a07f548e5dc
  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], completed_at: params[:task][:completed_at])#instantiate a new task
    if @task.save # save returns true if the database insert succeeds
      #redirect_to root_path # go to the index so we can see the task in the list
      redirect_to task_path(@task.id) #goes to page where task/:id page
      return
    else # save failed :(
      render :new # show the new task form view again
      return
    end
  end

  def new
    @task = Task.new
  end
  
  def edit
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      #head :not_found
      redirect_to root_path
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
      redirect_to task_path # go to the index so we can see the book in the list
      return
    else # save failed :(
      render :edit # show the new book form view again
      return
    end
  end

  def destroy
    task_id = params[:id]
    @task = Task.find_by_id(task_id)

    if @task.nil?
      head :not_found
      return
    end

    @task.destroy

    redirect_to tasks_path
    return
  end
end #class
