require 'rails_helper'

RSpec.feature 'can see all todos on the list in an overview', type: :feature do
  it 'has the right title on the index page' do
    visit todos_path

    within ('h1') do
      expect(page).to have_content('ToDos')
    end
  end

  it 'lists all ToDos in an overview' do
    Todo.create(task: 'task1',
                deadline: Date.strptime('09-30-2016', '%m-%d-%Y'),
                completed: true)

    Todo.create(task: 'task2',
                deadline: Date.strptime('09-30-2016', '%m-%d-%Y'),
                completed: true,
                more_details: 'this is task 2')

    Todo.create(task: 'task3',
                deadline: Date.strptime('09-30-2016', '%m-%d-%Y'),
                more_details: 'this is task 3')

    visit todos_path

    expect(page).to have_content('task1')
    expect(page).to have_content('task2')
    expect(page).to have_content('task3')
  end

  it 'includes task proper task details in overview' do
    Todo.create(task: 'task',
                deadline: Date.strptime('09-30-2016', '%m-%d-%Y'),
                completed: true,
                more_details: 'this is a task')

    visit todos_path

    expect(page).to have_content('task')
    expect(page).to have_content(Date.strptime('09-30-2016', '%m-%d-%Y'))

    within 'table' do
      expect(page).to have_checked_field('todo')
    end

    expect(page).to_not have_content('this is a task')
  end


end
