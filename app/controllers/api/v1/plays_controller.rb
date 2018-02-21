class Api::V1::PlaysController < ApplicationController

  def create
    game = Game.find(game_params)
    response = OxfordServices.new(word_params).validate
    unless response == "invalid word"
      game.plays.create(user_id: user_params, word: word_params)
    else
      return "#{word_params} is not a valid word"
    end
    redirect_to root_path
  end

  private
    def user_params
      params.require("user_id")
    end

    def word_params
      params.require("word")
    end

    def game_params
      params.require(:id)
    end

end
