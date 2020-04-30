TASKS = [
  { description: "bake a cake", assignee: "Angela" },
  { description: "look super cute", assignee: "Picchu" },
  { description: "cronch on carrots", assignee: "Tater Tot" },
  { description: "stare at birds", assignee: "Elvy" }
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
