class Task < ApplicationRecord
  task1 = Task.create(name: 'Task 1', description: "Do the laundry", completed_at: "20th Mar")
  task2 = Task.create(name: "Task 2", description: "Watch all rails videos", completed_at: "1st Apr")
  task3 = Task.create(name: "Task 3", description: "Do dinner", completed_at: '2nd Feb')
end
