class Todo < ActiveRecord::Base

  validates :task, :deadline, presence: true
  validate :deadline_cannot_be_in_past, :completed_cannot_be_empty

  def deadline_cannot_be_in_past
    if deadline && deadline < Date.current
      errors.add(:deadline, "Date cannot be in the past.")
    end
  end

  def completed_cannot_be_empty
    if completed.nil?
      errors.add(:completed, "Completed must be present.")
    end
  end
end
