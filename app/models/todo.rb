class Todo < ActiveRecord::Base

  validates :task, presence: true
  validates :deadline, presence: true
  validate :deadline_cannot_be_in_past

  def deadline_cannot_be_in_past
    if deadline && deadline < Date.current
      errors.add(:deadline, "Date cannot be in the past.")
    end
  end
end
