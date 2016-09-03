require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:valid_attributes) {
    {
      task: 'Make ToDo list',
      deadline: Date.new(2016,9,2),
      completed: false
    }
  }

  it 'is valid with valid attributes' do
    expect(Todo.new(valid_attributes)).to be_valid
  end

  describe 'task' do
    it 'is invalid if task is empty' do
      valid_attributes[:task] = nil

      expect(Todo.new(valid_attributes)).to_not be_valid
    end

    it 'is invalid if task is an empty string' do
      valid_attributes[:task] = ""

      expect(Todo.new(valid_attributes)).to_not be_valid
    end
  end

  describe 'deadline' do
    it 'is invalid if deadline is empty' do
      valid_attributes[:deadline] = nil

      expect(Todo.new(valid_attributes)).to_not be_valid
    end
  end
end
