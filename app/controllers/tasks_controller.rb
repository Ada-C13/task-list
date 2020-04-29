TASKS = [
  { name: "interview prep", description: "solving algorithms on leetcode"},
  { name: "grocery shopping", description: "buy bread, banans and apples"},
  { name: "practice rails", description: "read videos and code along"}
]

class TasksController < ApplicationController

  def index 
    @tasks = TASKS
  end
end
