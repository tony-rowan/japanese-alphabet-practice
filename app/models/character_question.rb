class CharacterQuestion < Question
  def self.create
    new
  end

  def initialize
    select_characters
    select_question
  end

  private

  attr_reader :character_a, :character_b

  def select_characters
    @character_a = Character.random
    @character_b = Character.random

    select_characters if character_a.romaji == character_b.romaji
  end

  def select_question
    character = rand > 0.5 ? character_a : character_b
    letter = rand > 0.5 ? :hiragana : :katakana
    @character = character
    @question = character.send(letter)
    @answers = [character_a.romaji, character_b.romaji]
    @correct_answer = character.romaji
  end
end
