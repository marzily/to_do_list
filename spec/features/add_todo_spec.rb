require 'rails_helper'

RSpec.feature 'add ToDo to list', type: :feature do
  it 'has a button to create a new ToDo on the landing page' do
    visit root_path

    expect(page).to have_button('Add ToDo')

    click_button('Add ToDo')

    expect(current_path).to eq(new_todo_path)
  end

  before(:each) {
    visit new_todo_path
  }

  it 'has the right content on the new page' do
    expect(page).to have_content('Create a New ToDo')
  end

  it 'lets you add a ToDo and redirects to show' do
    fill_in('Task', with: 'bake stuff')
    fill_in('Deadline', with: '09-30-2016')
    click_button('Add to List')

    expect(current_path).to eq(todo_path(id: Todo.last.id))
    expect(page).to have_content('bake stuff')
  end

  it 'saves the ToDo to the list' do
    fill_in('Task', with: 'complete rails app')
    fill_in('Deadline', with: '09-30-2016')
    within('table') do
      check('todo[completed]')
    end
    click_button('Add to List')

    visit todos_path

    within('table') do
      expect(page).to have_content('complete rails app')
    end

    within 'table' do
      expect(page).to have_checked_field('todo')
    end
  end

  it 'has a button to return to list overview' do
    expect(page).to have_button('ToDos List')

    click_button('ToDos List')

    expect(current_path).to eq(todos_path)
  end
end
