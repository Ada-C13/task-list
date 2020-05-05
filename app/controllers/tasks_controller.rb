# TASKS = [
#     {task: "Clean the dishes"},
#     {task: "Take out the trash"},
#     {task: "Take the kids to the park"}
# ]

class TasksController < ApplicationController
    def index
        @tasks= Task.all
    end
    
    def new
        @task = Task.new
    end

    def create
        @task = Task.new(name: params[:task][:name],description: params[:task][:description],completed_at: params[:task][:completed_at]) 
        if @task.save
          redirect_to task_path(@task.id)
          return
        else 
          render :new 
          return
        end
    end
    
    def show
        task_id= params[:id]
        @task = Task.find_by(id: task_id)
        if @task.nil?
            redirect_to tasks_path
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
        @task= Task.find_by(id: params[:id])
        if @task.nil?
            head :not_found
            return 
        elsif @task.update(
            name: params[:task][:name],
            description: params[:task][:description],
            completed_at: params[:task][:completed_at]
        )
            redirect_to tasks_path
            return
        else
            render :edit
            return
        end
    end

    def update_completed_task
        @task= Task.find_by(id: params[:id])
        if @task.completed_at == nil
            if @task.update(
                completed_at: Date.today.to_s
            ) 
                # redirect_to tasks_path, notice:"Task Completed"
                redirect_to request.referrer
                return
            end
        elsif @task.completed_at != nil
            if @task.update(
                completed_at: nil
            ) 
                # redirect_to tasks_path, notice:"Task Completed"
                redirect_to request.referrer
                return
            end
        end
    end

    def destroy
        task_id = params[:id]
        @task = Task.find_by(id: task_id)
    
        if @task.nil?
          head :not_found
          return
        end
    
        @task.destroy
    
        redirect_to tasks_path
        return
    end

end
