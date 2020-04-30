# TASKS = %w[task1 task2 task3 task4].freeze

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
end
