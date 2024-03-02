require_relative 'user'
require_relative 'tweet'

class Favorite
  attr_reader :id, :user_id, :tweet_id

  def initialize(id:, user_id:, tweet_id:)
    @id = id
    @user_id = user_id
    @tweet_id = tweet_id
  end

  def present?
    @id != nil
  end

  def self.build_by_user_and_tweet(user_id:, tweet_id:, id:)
    Favorite.new(id: id, user_id: user_id, tweet_id: tweet_id)
  end
end