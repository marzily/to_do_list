require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:valid_attributes) {
    {
      task: 'Make ToDo list',
      deadline: Date.current,
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

    it 'is invalid if deadline is not a Date object' do
      valid_attributes[:deadline] = "1234"

      expect(Todo.new(valid_attributes)).to_not be_valid
    end

    it 'cannot have a deadline that is in the past' do
      valid_attributes[:deadline] = Date.new(2000,1,1)

      expect(Todo.new(valid_attributes)).to_not be_valid
    end
  end

  describe 'completed' do

  end
end
