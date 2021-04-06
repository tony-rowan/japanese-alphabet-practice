require "rails_helper"

RSpec.describe Character do
  describe ".random" do
    it "returns a character" do
      expect(Character.random).to be_a(Character)
      expect(Character.all).to include(Character.random)
    end
  end

  describe ".find_by_hiragana_or_katakana" do
    it "returns the character that matches the given hiragana" do
      character = Character.find_by_hiragana_or_katakana("あ")
      expect(character).to eq(Character.find_by(romaji: "a"))
    end

    it "returns the character that matches the given hiragana" do
      character = Character.find_by_hiragana_or_katakana("ア")
      expect(character).to eq(Character.find_by(romaji: "a"))
    end
  end
end
