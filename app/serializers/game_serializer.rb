class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object[:id]
  end

  def turns
    

    # object.plays.map do |play|
    #   value = {}
    #   value["user_id"] = play.user_id
    #   value["score"] = play.score
    #   value
    # end
  end

  # def scores
  #   turns.reduce{|sum, score| sum.merge( score ){|key, first_score, second_score| first_score + second_score}}
  # end

end
