require "rails_helper"

RSpec.describe Character do
  describe ".random" do
    it "returns a character" do
      expect(Character.random).to be_a(Character)
      expect(Character.all).to include(Character.random)
    end
  end
end
