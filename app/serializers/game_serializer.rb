class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object[:id]
  end

  def scores
    # sorted = object.plays.sort_by do |play|
    #            play.user_id
    #          end
    #
    # user_1_id = sorted[0].user_id
    # user_2_id = sorted[-1].user_id
    #
    # user_1_plays = Play.where(user_id: user_1_id)
    # user_2_plays = Play.where(user_id: user_2_id)
    #
    # user_1_plays.map do |play|
    #   value = {}
    #     value["user_id"] = play.user_id
    #     value["score"] = play.score
    #     value
    #
    # binding.pry

    array = object.plays.map do |play|
      value = {}
      value["user_id"] = play.user_id
      value["score"] = play.score
      value
    end

    binding.pry

    array.sum {|h| h["score"]}
  end

  # def scores
  #   turns.reduce{|sum, score| sum.merge( score ){|key, first_score, second_score| first_score + second_score}}
  # end

end
