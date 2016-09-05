require "rails_helper"

RSpec.feature "can see all todos on the list in an overview", type: :feature do
  it "has the right title on the index page" do
    visit todos_path

    within ("h1") do
      expect(page).to have_content("ToDos")
    end
  end

  


end
