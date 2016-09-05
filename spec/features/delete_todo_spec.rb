require 'rails_helper'

RSpec.feature 'delete ToDos', type: :feature do
  before(:each) {
    Todo.create(task: 'make pancakes',
                deadline: Date.strptime('09-30-2016', '%m-%d-%Y'),
                more_details: 'next time make waffles')
  }

  it 'has delete buttons beside ToDos in the list' do
    visit todos_path

    expect(page).to have_button('Delete')
  end

  it 'deletes a task if "Delete" is clicked from list overview' do
    visit todos_path
    click_button('Delete')

    expect(page).to_not have_content('make pancakes')
  end

  it 'has a delete button in the task show page' do
    visit todo_path(id: Todo.last.id)

    expect(page).to have_button('Delete')
  end

  it 'deletes a task if "Deleted" is clicked from task show page' do
    visit todo_path(id: Todo.last.id)
    click_button('Delete')

    expect(current_path).to eq(todos_path)
    expect(Todo.last).to eq(nil)
  end
end
