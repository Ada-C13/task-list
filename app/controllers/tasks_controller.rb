TASKS = [
    {task: "Clean the dishes"},
    {task: "Take out the trash"},
    {task: "Take the kids to the park"}
]


class TasksController < ApplicationController
    def index
        @tasks= TASKS
    end
end
