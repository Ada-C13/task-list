class TasksController < ApplicationController

	def index
		@tasks = Task.all
	end

  # Single book display.
	def show
		task_id = params[:id]
		@task = Task.find_by(id: task_id)

		if @task.nil? # if task cannot be found
			head :not_modified
			return
		end
	end
 
  # Create a new task.
	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		
		if @task.save # if a new task if made and saved
      redirect_to task_path(@task)
      return
		else
      render :new, :bad_request
      return
		end
	end

  # Edit and update an existing task.
	def edit
    @task = Task.find_by(id: params[:id]) # Locate existing task by ID.

    if @task.nil?
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
      completed_at: params[:task][:completed_at])
    
      redirect_to task_path(@task)
      return
    else
      render :edit
      return
    end
  end
  
  # Delete a record.
  def destroy
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      head :not_found
      return
    else
      @task.destroy
      redirect_to tasks_path
      return
    end
  end

  def completed?
    @task = Task.find_by(id: params[:id])
    puts "********* #{@task.completed_at == ""} *****"
    if (@task.completed_at == "") == true
      @task.update(completed_at: Time.now)
    else
      @task.update(completed_at: "")
    end

    redirect_to tasks_path
  end

  private

  def task_params
    return params.require(:task).permit(:name, :description)
  end

end
