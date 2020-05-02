# TASKS = %w[task1 task2 task3 task4].freeze

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    id = params[:id].to_i
    # @book = Book.find(id) #this returns a Record not fount instead of a nil for an invalid id
    @task = Task.find_by(id: id)
    if @task.nil?
      head :not_found
      return
    end
  end
end
