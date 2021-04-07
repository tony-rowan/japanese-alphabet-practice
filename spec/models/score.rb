require "rails_helper"

RSpec.describe Score do
  describe "#accuracy" do
    it "returns the percentage of attempts that are correct" do
      expect(Score.new(correct: 1, attempts: 1)).to eq(100.0)
      expect(Score.new(correct: 2, attempts: 2)).to eq(100.0)
      expect(Score.new(correct: 0, attempts: 1)).to eq(0.0)
      expect(Score.new(correct: 1, attempts: 2)).to eq(50.0)
      expect(Score.new(correct: 3, attempts: 4)).to eq(75.0)
    end
  end
end
