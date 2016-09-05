require 'rails_helper'

RSpec.feature 'view ToDo details', type: :feature do
  let(:todo) {
    Todo.create(task: 'make pancakes',
                deadline: Date.strptime('09-30-2016', '%m-%d-%Y'),
                more_details: 'add chocolate chips, not quite time for pumpkin spice')
  }

  before(:each) {
    visit todo_path(id: todo.id)
  }

  it 'has the proper title' do
    expect(page).to have_content(todo.task)
  end

  it 'has the correct deadline' do
    expect(page).to have_content(todo.deadline)
  end

  it 'is not checked if task is not completed' do
    expect(page).to have_unchecked_field('todo')
  end

  it 'shows task details' do
    expect(page).to have_content(todo.more_details)
  end

  it 'has a button to return to ToDos list' do
    expect(page).to have_button('ToDos List')
    
    click_button('ToDos List')

    expect(current_path).to eq(todos_path)
  end
end
