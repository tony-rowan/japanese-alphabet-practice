class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.random
  end
end
