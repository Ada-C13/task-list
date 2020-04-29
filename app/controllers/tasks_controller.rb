class TasksController < ApplicationController
  def index
    @to_do = ["Ada Lessons and Homework", "Order food for dinner", "piano practice", "Animal Crossing daily stuff"]
  end
end
