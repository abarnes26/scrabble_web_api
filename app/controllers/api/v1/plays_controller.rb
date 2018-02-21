class Api::V1::PlaysController < ApplicationController

  def create
    game = Game.find(game_params)
    game.plays.create(user_id: user_params, word: word_params)
    
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
