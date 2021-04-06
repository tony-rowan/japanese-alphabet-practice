class QuestionsController < ApplicationController
  def show
    @question = question
  end

  private

  def question
    @question ||= Question.create
  end

  def character_path_for_answer(answer)
    character_path(question.character.romaji, correct: answer == question.correct_answer)
  end
  helper_method :character_path_for_answer
end
