class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = character
    @next_page = next_page
  end

  private

  def character
    @character ||= Character.find_by(romaji: params[:id])
  end

  def next_page
    root_path(display: params[:display])
  end
end
