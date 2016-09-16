require 'rails_helper'

RSpec.feature 'create new task from old', type: :feature do
  before(:each) {
    Todo.create(task: 'task1',
                deadline: Date.strptime('09-30-2016', '%m-%d-%Y'))
  }

  it 'has a dupicate button on the show page' do
    visit todo_path(id: Todo.last.id)

    expect(page).to have_button('Duplicate')
  end

  it 'takes us to the correct path' do
    visit todo_path(id: Todo.last.id)

    click_button('Duplicate')

    expect(current_path).to eq(edit_todo_path(id: Todo.last.id))
  end

  it 'has a pre-populated page' do
    visit edit_todo_path(id: Todo.last.id)

    expect(page).to have_content('Create New ToDo')
  end



end
