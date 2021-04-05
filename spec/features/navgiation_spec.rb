require "rails_helper"

RSpec.feature "Navigation" do
  scenario "Visiting the homepage" do
    visit(root_path)

    expect(page).to have_link("Practice")
    expect(page).to have_link("Learn")
  end

  scenario "Navigating from the homepage to the learn page" do
    visit(root_path)

    click_on("Learn")

    expect(page).to have_current_path(characters_path)
  end

  scenario "Navigating from the learn page to the home(practice)page" do
    visit(characters_path)

    click_on("Practice")

    expect(page).to have_current_path(root_path)
  end
end
