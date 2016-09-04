class Todo < ActiveRecord::Base

  validates :task, :deadline, presence: true
  validate :completed_cannot_be_empty

# cannot validate presence for 'completed == false' value
  def completed_cannot_be_empty
    if completed.nil?
      errors.add(:completed, "Completed must be present.")
    end
  end
end
