TASKS = [
  {name: "finish wave 1", description: "need to finish wave 1 soon"},
  {name: "finish wave 2", description: "need to finish wave 2 after wave 1"},
  {name: "finish wave 3", description: "need to finish wave 3 after wave 2"},
  {name: "finish wave 4", description: "need to finish wave 4 after wave 3"},
]

class TasksController < ApplicationController

  def index
    @tasks = TASKS
  end

end
