class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = character
    @question_response = question_response
  end

  private

  def character
    @character ||= Character.find_by(romaji: params[:id])
  end

  def question_response
    return nil unless params[:correct]

    if params[:correct] == "true"
      "Correct!"
    else
      "Not Quite!"
    end
  end
end
