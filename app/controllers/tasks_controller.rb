TASKS = [
  { name: "Walk the Dogs", description: "Bone and Noodle like to go for a walk for about 30 minutes."},
  { name: "Clean the Kitchen", description: "Unload and load the dishwasher, wipe the counters, and sweep the floor."},
  { name: "Take a Nap", description: "You've earned a rest."}
]


class TasksController < ApplicationController

  def index
    @tasks = TASKS
  end
  
end
