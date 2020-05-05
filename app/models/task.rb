class Task < ApplicationRecord
  # gets all methods from ApplicationRecord
  # knows which table to go to when we say Task.all, Task.find_by(***)
  # default order is by id since not specified
end
