class Score
  attr_accessor :correct, :attempts

  def initialize(correct:, attempts:)
    @correct = correct
    @attempts = attempts
  end

  def accuracy
    correct / attempts.to_f * 100
  end
end
