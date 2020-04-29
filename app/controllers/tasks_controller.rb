

class TasksController < ApplicationController

    def index 
      @tasks = Task.all
    end 

    def show 
      id = params[:id].to_i
      @task = Task.all[id]

      if @task.nil?
        head :not_found
        return
      end 
    end 

end
