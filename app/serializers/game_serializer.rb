class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object[:id]
  end

  def scores
    object.plays[-2..-1].map do |play|
      value = {}
      value["user_id"] = play.user_id
      value["score"] = play.score
      value
    end
  end

end
