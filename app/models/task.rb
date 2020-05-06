class Task < ApplicationRecord

  # singular because each task only belongs to a single person
  belongs_to :person
end
