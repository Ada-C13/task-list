TASKS = [
    {name: "Bob", description: "groceries", completed_at: "5pm"},
    {name: "Jane", description: "homework", completed_at: "11am"}
]

class TasksController < ApplicationController
    def index
        @tasks = TASKS
    end
end
