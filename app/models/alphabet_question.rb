class AlphabetQuestion < Question
  def self.create
    new
  end

  def initialize
    @character = Character.random
    @answers = [:hiragana, :katakana]
    @correct_answer = answers.sample
    @question = character.send(correct_answer)
  end
end
