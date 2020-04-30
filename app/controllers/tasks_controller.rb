class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  # request checkbox checked (put)
  # update model, save to db
  # redirect user to reload another page
 # send to redirect to index, reload the whole thing
 # since model updated, re-render whole page

end
