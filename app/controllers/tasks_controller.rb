TASKS = ['a', 'b', 'c']

class TasksController < ApplicationController

	def index
		@tasks = TASKS
	end

end
