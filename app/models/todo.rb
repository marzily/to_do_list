class Todo < ActiveRecord::Base

  validates :task, presence: true
  validates :deadline, presence: true

end
