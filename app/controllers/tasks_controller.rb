

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
      task = Task.new(
        name: params[:task][:name], 
        description: params[:task][:description]
      )
    
      if task.save
        redirect_to tasks_path
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
        redirect_to edit_task_path
        return 
      end 
    end 

    def update 
      @task = Task.find_by(id: params[:id])

      if @task.nil?
        flash[:error] = "Could not find task with id: #{task_id}"
        redirect_to edit_task_path
        return
        
      elsif @task.update(
        author: params[:task][:name], 
        description: params[:task][:description], 
        completion_at: params[:task][:completion_at]
      )
        redirect_to edit_task_path 
        return
      else 
        render :edit 
        return
      end
    end 

    def destroy 

    end 
 

    def mark_complete

    end 

end




