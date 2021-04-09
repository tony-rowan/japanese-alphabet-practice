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
    kana = [:romaji, :hiragana, :katakana].sample
    @character = rand > 0.5 ? character_a : character_b
    @question = character.send(kana)

    if kana == :romaji
      kana = [:hiragana, :katakana].sample
      @answers = [character_a.send(kana), character_b.send(kana)]
      @correct_answer = character.send(kana)
    else
      @answers = [character_a.romaji, character_b.romaji]
      @correct_answer = character.romaji
    end
  end
end
