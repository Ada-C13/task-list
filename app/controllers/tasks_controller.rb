TASKS = ['Yoga', 'Coding', 'Review CS fun', 'interview practice', 'Dancing', 'Taking a nap', 'Running']


# TASKS = []

class TasksController < ApplicationController
  def index
    @tasks = TASKS 
  end 
end
