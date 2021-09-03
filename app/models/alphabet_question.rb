class AlphabetQuestion < Question
  def self.create
    new
  end

  def initialize
    @text = "Which alphabet is this character from?"
    @character = Character.random
    @answers = [:hiragana, :katakana]
    @correct_answer = answers.sample
    @question = character.send(correct_answer)
  end
end
