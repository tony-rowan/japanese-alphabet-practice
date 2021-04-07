require "rails_helper"

RSpec.describe QuestionResponse do
  describe "#text" do
    it "says so when the user was correct" do
      expect(QuestionResponse.new(correct: "true").text).to eq("Correct!")
    end

    it "says so when the user was wrong" do
      expect(QuestionResponse.new(correct: "false").text).to eq("Not Quite!")
    end
  end

  describe "#body_class" do
    it "says so when the user was correct" do
      expect(QuestionResponse.new(correct: "true").body_class).to eq("bg-green-500")
    end

    it "says so when the user was wrong" do
      expect(QuestionResponse.new(correct: "false").body_class).to eq("bg-red-500")
    end
  end
end
