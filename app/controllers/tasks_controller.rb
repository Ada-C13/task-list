# TASKS = [
#   {todo: "more hello", text: "more stuff"},
#   {todo: "no hello", text: "more stuff"}
# ]

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
end
