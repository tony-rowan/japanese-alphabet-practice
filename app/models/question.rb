class Question
  def self.create(random = rand)
    if random > 0.66
      AlphabetQuestion.create
    else
      CharacterQuestion.create
    end
  end

  attr_reader :character, :question, :answers, :correct_answer
end
