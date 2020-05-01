# TASKS = [
#   { number: "Task one", text: "Mark Complete"},
#   { number: "Task two", text: "Unmark Complete"},
#   { number: "Task three", text: "Mark Complete again"}
# ]



class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

end
