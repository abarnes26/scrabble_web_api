require 'rails_helper'

describe "Game API" do
  context "HTTP Post" do
    it "creates play based on passed params with valid word" do
      VCR.use_cassette("user_posts_valid_word") do
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

    it "creates play based on passed params with invalid word" do
      VCR.use_cassette("user_posts_invalid_word") do
        josh = User.create(id: 1, name: "Josh")
        sal = User.create(id: 2, name: "Sal")
        game = Game.create(player_1: josh, player_2: sal)
        josh.plays.create(game: game, word: "sal", score: 3)
        josh.plays.create(game: game, word: "zoo", score: 12)
        sal.plays.create(game: game, word: "josh", score: 14)
        sal.plays.create(game: game, word: "no", score: 2)

        post "/api/v1/games/#{game.id}/plays?user_id=1&word=ddooop"

        get "/api/v1/games/#{game.id}"

        expect(response).to be_success

        game_call = JSON.parse(response.body)

        expect(game_call["game_id"]).to eq(game.id)
        expect(game_call["scores"][0]["user_id"]).to eq(1)
        expect(game_call["scores"][0]["score"]).to eq(15)
        expect(game_call["scores"][1]["user_id"]).to eq(2)
        expect(game_call["scores"][1]["score"]).to eq(16)
      end
    end
  end
end
