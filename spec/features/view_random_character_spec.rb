require "rails_helper"

RSpec.describe "View random character" do
  it "displays a single character" do
    allow(Character).to receive(:random)
      .and_return(Character.find_by(romaji: "a"))

    visit(root_path)

    expect(page).to have_text("a")
    expect(page).to have_text("あ")
    expect(page).to have_text("ア")

    allow(Character).to receive(:random)
      .and_return(Character.find_by(romaji: "i"))

    visit(root_path)

    expect(page).to have_text("i")
    expect(page).to have_text("い")
    expect(page).to have_text("イ")
  end
end
