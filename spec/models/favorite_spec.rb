require_relative '../../app/models/favorite' #favorite.rbの相対パス

RSpec.describe Favorite do
  describe '#present?' do
    context 'idがnilでない場合' do
      it 'present?がtrueになる' do
        favorite = Favorite.new(id: 1, user_id: 22, tweet_id: 333)
        expect(favorite.present?).to eq true
      end
    end
    
    context 'idがnilの場合' do
      it 'present?がfalseになる' do
        favorite = Favorite.new(id: nil, user_id: 22, tweet_id: 333)
        expect(favorite.present?).to eq false
      end
    end
  end

  describe '#self.build_by_user_and_tweet' do
    context 'Userクラスのインスタンスにid = 1を、Tweetクラスのインスタンスにid = 22を渡すとき' do
      it 'favorite.user_idが1を、favorite.tweet_idが22を返す' do
        user = User.new(id: 1, email: 'user@example.com', password: 'p@ssw0rd')
        tweet = Tweet.build_by_user(user: user, id: 22, title: 'タイトル', tweet_content: '本文')
        favorite = Favorite.build_by_user_and_tweet(user_id: user.id, tweet_id: tweet.id, id: 111)
        aggregate_failures do
          expect(favorite.user_id).to eq 1
          expect(favorite.tweet_id).to eq 22
        end
      end
    end
  end
end