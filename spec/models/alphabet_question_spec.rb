require "rails_helper"

RSpec.describe AlphabetQuestion do
  describe ".create" do
    it "creates a question that asks to identify the alphabet for the given letter" do
      question = AlphabetQuestion.create
      character = Character.find_by_kana(question.question)

      expect(question).not_to be_nil
      expect(character).not_to be_nil
      expect(question.question).not_to be_nil
      expect(question.answers).not_to be_nil
      expect(question.correct_answer).not_to be_nil

      expect(question.answers).to eq([:hiragana, :katakana])
      expect(question.answers).to include(question.correct_answer)
      expect(character.send(question.correct_answer)).to eq(question.question)

      expect(question.character).to eq(character)
    end
  end
end
