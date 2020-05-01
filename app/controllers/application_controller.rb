TASKS = [
  { assignee: "Jay", task: "wash the dishes"},
  { assignee: "Sarah", task: "wash the clothes"},
  { assignee: "Sam", task: "walk the dog"}
]

class ApplicationController < ActionController::Base
  def index
    @tasks = TASKS
  end
end
