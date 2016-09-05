require "rails_helper"

RSpec.feature "add ToDo to list", type: :feature do
  it 'has a button to create a new ToDo on the landing page' do
    visit root_path

    expect(page).to have_button("Add a ToDo")
  end

  it 'has the right content on the new page' do
    visit new_todo_path

    expect(page).to have_content("Create a New ToDo")
  end

  it 'lets you add a ToDo and redirects to show' do
    visit new_todo_path

    fill_in("Task", with: "bake stuff")
    fill_in("Deadline", with: "09-30-2016")
    click_button("Add to List")

    expect(current_path).to eq(todo_path(id: Todo.last.id))
    expect(page).to have_content("bake stuff")
  end

  it 'saves the ToDo to the list' do
    visit new_todo_path

    fill_in("Task", with: "complete rails app")
    fill_in("Deadline", with: "09-30-2016")
    within("form") do
      check("todo[completed]")
    end
    click_button("Add to List")

    visit todos_path

    within("table") do
      expect(page).to have_content("complete rails app")
    end

    within "table" do
      expect(page).to have_checked_field("todo")
    end
  end
end
