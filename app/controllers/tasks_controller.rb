
TASKS = [
  {name: "Review curriculum", description: "review textbook and videos"},
  {name: "Grocery Run", description: "grocery run and buy avocados"},
  {name: "Workout", description: "yoga or zumba"},
  {name: "Project", description:"due 05/05"},
]

class TasksController < ApplicationController

  def index
    @tasks = TASKS
  end

end
