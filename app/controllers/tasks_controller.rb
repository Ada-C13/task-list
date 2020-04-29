TASKS = [
  { name: "Add", description: "Add the files", completed_at: nil},
  { name: "Commit", description: "Commit the changes", completed_at: nil},
  { name: "Push", description: "Push to GitHub", completed_at: nil},
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end

end
