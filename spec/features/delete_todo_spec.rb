require 'rails_helper'

RSpec.feature 'delete ToDos', type: :feature do
  before(:each) {
    Todo.create(task: 'make pancakes',
                deadline: Date.strptime('09-30-2016', '%m-%d-%Y'),
                more_details: 'next time make waffles')
  }

  it 'has delete buttons beside ToDos in the list' do
    visit(todos_path)

    expect(page).to have_button('Delete')
  end

end
