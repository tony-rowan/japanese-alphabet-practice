class CharactersController < ApplicationController
  include ScoreKeeping

  def index
    @characters = Character.all
  end

  def show
    @character = character
    @question_response = question_response

    update_score
  end

  private

  def character
    Character.find_by(romaji: params[:id])
  end

  def question_response
    return nil unless params[:correct]

    QuestionResponse.new(correct: params[:correct])
  end

  def update_score
    return unless @question_response

    @score.correct += 1 if question_response.correct?
    @score.attempts += 1
  end
end
