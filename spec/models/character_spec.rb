require "rails_helper"

RSpec.describe Character do
  describe ".random" do
    it "returns a character" do
      expect(Character.random).to be_a(Character)
      expect(Character.all).to include(Character.random)
    end
  end

  describe ".find_by_kana" do
    it "returns the character that matches the given romaji" do
      character = Character.find_by_kana("a")
      expect(character).to eq(Character.find_by(romaji: "a"))
    end

    it "returns the character that matches the given hiragana" do
      character = Character.find_by_kana("あ")
      expect(character).to eq(Character.find_by(romaji: "a"))
    end

    it "returns the character that matches the given hiragana" do
      character = Character.find_by_kana("ア")
      expect(character).to eq(Character.find_by(romaji: "a"))
    end
  end
end
