require "rails_helper"

RSpec.feature "add todo to list", type: :feature do
  it 'has the right content on the new page' do
    visit new_todo_path
    expect(page).to have_content("Create a New ToDo")
  end

  it 'lets you add a Todo to the list' do
    visit new_todo_path

    fill_in("Task", with: "bake stuff")
    fill_in("Month", with: "09")
    fill_in("Day", with: "30")
    fill_in("Year", with: "2016")
    click_button("Add to List")

    expect(current_path).to eq(todos_path)
    within("table") do
      expect(page).to have_content("bake stuff")
    end
  end
end
