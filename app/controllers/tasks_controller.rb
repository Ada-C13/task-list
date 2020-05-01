class TasksController < ApplicationController

	def index
		@tasks = Task.all
	end

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
		@task = Task.new(
			name: params[:task][:name], 
			description: params[:task][:description], 
			completed_at: params[:task][:completed_at])
		
		if @task.save # if a new task if made and saved
			redirect_to task_path(@task)
		else
			render :new, :bad_request
		end
	end

  # Edit and update an existing task.
	def edit
		@task = Task.find_by(id: params[:id]) # Locate existing task by ID.
	end

	def update
		@task = Task.find_by(id: params[:id])
		@task.update(
			name: params[:task][:name], 
			description: params[:task][:description],
			completed_at: params[:task][:completed_at])
		
		redirect_to task_path(@task)
  end
  
  # Delete a record.
  def destroy
    Task.destroy(params[:id])
    redirect_to tasks_path
  end
end
