class FlashcardsController < ApplicationController
  def show
    @character = character
    @symbol = symbol
    @next_page = next_page
  end

  private

  def character
    @character ||= Character.random
  end

  def symbol
    character.send(display.to_sym)
  end

  def display
    params[:display] || [:hiragana, :katakana].sample
  end

  def next_page
    character_path(character.romaji, display: params[:display])
  end
end
