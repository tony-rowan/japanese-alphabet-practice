class CharactersController < ApplicationController
  include ScoreKeeping

  def index
    @characters = Character.all
  end

  def show
    @character = character
    @question_response = question_response
  end

  private

  def character
    Character.find_by(romaji: params[:id])
  end

  def question_response
    return nil unless params[:correct]

    QuestionResponse.new(correct: params[:correct])
  end
end
