require "rails_helper"

RSpec.describe CharacterQuestion do
  describe ".create" do
    it "creates a question that asks to identify the romaji for the hiragana or katakana" do
      question = CharacterQuestion.create
      character = Character.find_by_kana(question.question)

      expect(question).not_to be_nil
      expect(character).not_to be_nil
      expect(question.question).not_to be_nil
      expect(question.answers).not_to be_nil
      expect(question.correct_answer).not_to be_nil

      expect(question.answers.uniq).to eq(question.answers)
      expect(question.answers).to include(question.correct_answer)
      expect(question.character).to eq(character)
    end
  end
end
