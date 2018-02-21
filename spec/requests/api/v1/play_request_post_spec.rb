require 'rails_helper'

describe "Game API" do
  context "HTTP GET" do
    it "returns details of requested game" do
      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")
      game = Game.create(player_1: josh, player_2: sal)
      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)

      post "/api/v1/games/#{game.id}/plays?user_id=1&word=at"

      get "/api/v1/games/#{game.id}" 

      expect(response).to be_success

      game_call = JSON.parse(response.body)

      expect(game_call["game_id"]).to eq(game.id)
      expect(game_call["scores"][0]["user_id"]).to eq(1)
      expect(game_call["scores"][0]["score"]).to eq(17)
      expect(game_call["scores"][1]["user_id"]).to eq(2)
      expect(game_call["scores"][1]["score"]).to eq(16)
    end
  end
end
