require "rails_helper"

RSpec.describe Question do
  describe ".create" do
    it "returns either a character question or an alphabet question at random" do
      question = Question.create
      expect(question).not_to be_nil
      expect(question.is_a?(CharacterQuestion) || question.is_a?(AlphabetQuestion)).to be(true)
    end

    it "returns a character question 2/3 of the time" do
      expect(Question.create(0.65)).to be_a(CharacterQuestion)
    end

    it "returns an alphabet question 1/3 of the time" do
      expect(Question.create(0.67)).to be_a(AlphabetQuestion)
    end
  end
end
