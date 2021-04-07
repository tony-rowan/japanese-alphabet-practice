class AnswersController < ApplicationController
  include ScoreKeeping

  def create
    update_score
    redirect_to(character_path(romaji, correct: correct))
  end

  private

  def update_score
    @score.correct += 1 if correct == "true"
    @score.attempts += 1
  end

  def romaji
    params[:romaji]
  end

  def correct
    params[:correct]
  end
end
