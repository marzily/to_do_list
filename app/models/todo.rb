class Todo < ActiveRecord::Base
  validates :task, :deadline, presence: true
  validate :completed_cannot_be_empty

# cannot validate presence for 'completed == false' value
  def completed_cannot_be_empty
    if completed.nil?
      errors.add(:completed, 'Completed must be present.')
    end
  end

  def self.new_with_deadline(todo_params)
    Todo.new(task: todo_params[:task],
             deadline: Date.strptime(todo_params[:deadline], '%m-%d-%Y'),
             completed: todo_params[:completed],
             more_details: todo_params[:more_details])
  end

  def update_completed(completed_param)
    completed = completed_param
    
  end
end
