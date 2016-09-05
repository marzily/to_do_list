require "rails_helper"

RSpec.feature "add todo to list", type: :feature do
  it 'has the right content on the new page' do
    visit new_todo_path
    expect(page).to have_content("Create a New ToDo")
  end

  it 'lets you add a Todo' do
    visit new_todo_path

    fill_in("Task", with: "bake stuff")
    fill_in("Deadline", with: "09-30-2016")
    fill_in("Completed", with: false)
    click_button("Add to List")

    expect(current_path).to eq(todo_path(id: Todo.last.id))
    expect(page).to have_content("bake stuff")
  end

  it 'saves the Todo to the list' do
    visit new_todo_path

    fill_in("Task", with: "complete rails app")
    fill_in("Deadline", with: "09-30-2016")
    fill_in("Completed", with: false)
    click_button("Add to List")

    visit todos_path

    within("table") do
      expect(page).to have_content("complete rails app")
    end
  end
end
