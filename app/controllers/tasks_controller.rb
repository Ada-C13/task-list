require 'date'

class TasksController < ApplicationController

    def index 
      @tasks = Task.all
    end 

    def show 
      task_id = params[:id]
      @task = Task.find_by(id: task_id)
      
    
      if @task.nil?
        flash[:error] = "Could not find task with id: #{task_id}"
        redirect_to tasks_path
      end 

    end 

    def new 
      @task = Task.new
    end 

    def create
      task = Task.new(tasks_params)
    
      if task.save
        redirect_to task_path(task)
        return 
      else 
        redirect_to new_task_path
        return 
      end 
    end 


    def edit 
      task_id = params[:id]
      @task = Task.find_by(id: task_id)

      if @task.nil?
        flash[:error] = "Could not find task with id: #{task_id}"
        redirect_to tasks_path
      end 
    end 

    def update 
    
      task = Task.find_by(id: params[:id])

      if task.nil?
        flash[:error] = "Could not find task with id: #{task}"
        redirect_to tasks_path
        return
        
      elsif task.update(tasks_params)
        redirect_to task_path(task)
        return
      else 
        render :edit 
        return
      end
    end 

    def destroy 
      @task = Task.find_by(id: params[:id])

      if @task.nil?
        flash[:error] = "Could not find task with id: #{task_id}"
        redirect_to tasks_path
        return
      end 

      @task.destroy
        
      redirect_to tasks_path
      return 
    end 
 

    def mark_complete
      @task = Task.find_by(id: params[:id])

      if @task.nil?
        flash[:error] = "Could not find task with id: #{task_id}"
        redirect_to tasks_path
        return
      end

      
      @task.update(
        name: @task.name, 
        description: @task.description, 
        completed_at: Date.current.to_s
      )
      
      redirect_to task_path(@task)
      return 

    end 

    private 

    def tasks_params
      return params.require(:task).permit(:name, :description)
    end 

end




