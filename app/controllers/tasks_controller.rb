class TasksController < ApplicationController

  def index
    # most recently added task comes last on the list
    @tasks = Task.all.order(created_at: :asc)
  end

  def show
    task_id = params[:id].to_i
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
    # instead of name: params[:task][:name], use task_params for all params
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_path(@task.id)
      return
    else
      render :new
      return
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])

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
    elsif @task.update(task_params)
      redirect_to task_path(@task.id) # go to show page for id
      return
    else
      render :edit # show the edit form page again
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

  def mark_complete
    @task = Task.find_by(id: params[:id])
    
    if @task.nil?
      redirect_to tasks_path
      return
    else
      @task.update(
        completed_at: Time.now.strftime("%I:%M %p on %m/%d/%Y") 
      )
      redirect_to tasks_path
    end
  end

  def mark_uncomplete
    @task = Task.find_by(id: params[:id])

    @task.update(
      completed_at: nil
    )
    redirect_to tasks_path
  end

  # define strong params and only allow permitted fields to be submitted with forms
  private 

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end

end
