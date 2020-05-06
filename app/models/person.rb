class Person < ApplicationRecord

  #plural because many tasks could be associated with a single person

  has_many :tasks

end
