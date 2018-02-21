class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object[:id]
  end

  def scores
    [assemble_player_score(user_1_id, user_1_score), assemble_player_score(user_2_id, user_2_score)]
  end

  def assemble_player_score(player, score)
    {user_id: player, score: score}
  end

  def user_1_id
    Play.all[0].user_id
  end

  def user_2_id
    if Play.count.even?
      Play.all[-1].user_id
    else
      Play.all[-2].user_id
    end
  end

  def user_1_score
    Play.where(user_id: user_1_id).sum("score")
  end

  def user_2_score
    Play.where(user_id: user_2_id).sum("score")
  end


end
