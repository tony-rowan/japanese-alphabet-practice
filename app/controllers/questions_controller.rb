class QuestionsController < ApplicationController
  include ScoreKeeping

  def show
    @question = question
  end

  private

  def question
    @question ||= Question.create
  end

  def answer_path(answer)
    answers_path(romaji: question.character.romaji, correct: answer == question.correct_answer)
  end
  helper_method :answer_path
end
