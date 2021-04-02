require "rails_helper"

RSpec.describe "View all characters" do
  it "displays a table of all the characters" do
    visit(characters_path)

    expect(page).to have_text_in_order(%w[Romaji Hiragana Katakana])
    expect(page).to have_text_in_order(Character.all.flat_map { |c| [c.romaji, c.hiragana, c.katakana] })
  end
end
