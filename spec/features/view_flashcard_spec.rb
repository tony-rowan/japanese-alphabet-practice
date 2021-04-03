require "rails_helper"

RSpec.describe "View flashcards" do
  before do
    allow(Character).to receive(:random)
      .and_return(Character.find_by(romaji: "a"), Character.find_by(romaji: "e"))
  end

  scenario "displaying a single hiragana" do
    visit(root_path(display: :hiragana))

    within("#flashcards") do
      expect(page).to have_text("あ")
      expect(page).not_to have_text("a")
      expect(page).not_to have_text("ア")
    end

    click_on("Show")

    within("#flashcards") do
      expect(page).to have_text("a")
      expect(page).to have_text("あ")
      expect(page).to have_text("ア")
    end

    click_on("Again")

    within("#flashcards") do
      expect(page).to have_text("え")
      expect(page).not_to have_text("e")
      expect(page).not_to have_text("エ")
    end

    click_on("Show")

    within("#flashcards") do
      expect(page).to have_text("e")
      expect(page).to have_text("え")
      expect(page).to have_text("エ")
    end
  end

  scenario "displaying a single katakana" do
    visit(root_path(display: :katakana))

    within("#flashcards") do
      expect(page).to have_text("ア")
      expect(page).not_to have_text("a")
      expect(page).not_to have_text("あ")
    end

    click_on("Show")

    within("#flashcards") do
      expect(page).to have_text("a")
      expect(page).to have_text("あ")
      expect(page).to have_text("ア")
    end

    click_on("Again")

    within("#flashcards") do
      expect(page).to have_text("エ")
      expect(page).not_to have_text("e")
      expect(page).not_to have_text("え")
    end

    click_on("Show")

    within("#flashcards") do
      expect(page).to have_text("e")
      expect(page).to have_text("え")
      expect(page).to have_text("エ")
    end
  end
end
