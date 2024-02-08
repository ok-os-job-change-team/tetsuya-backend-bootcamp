require_relative '../../app/models/tweet' #tweet.rbの相対パス
require_relative '../../app/models/user' #user.rbの相対パス

RSpec.describe Tweet do
  describe '#present?' do
    context 'idがnilでない場合' do
      it 'present?がtrueになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: 'タイトル', tweet_content: '本文')
        expect(tweet.present?).to eq true
      end
    end
    
    context 'idがnilの場合' do
      it 'present?がfalseになる' do
        tweet = Tweet.new(id: nil, user_id: 1, title: 'タイトル', tweet_content: '本文')
        expect(tweet.present?).to eq false
      end
    end
  end

  describe '#self.build_by_user' do
    context 'Userクラスのインスタンスにid = 1を渡すとき' do
      it 'tweet.user_idが1を返す'do
        user = User.new(id: 1, email: 'user@example.com', password: 'p@ssw0rd')
        tweet = Tweet.build_by_user(user: user, id: 2, title: 'タイトル', tweet_content: '本文')
        expect(tweet.user_id).to eq 1
      end
    end
  end

  describe '#title_valid?' do
    context 'titleがnilの場合' do
      it 'title_valid?がfalseになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: nil, tweet_content: '本文')
        expect(tweet.title_valid?).to eq false
      end
    end

    context 'titleが空文字列の場合' do
      it 'title_valid?がfalseになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: '', tweet_content: '本文')
        expect(tweet.title_valid?).to eq false
      end
    end

    context 'titleが15文字の場合' do
      it 'title_valid?がtrueになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: '0123456789ABCDE', tweet_content: '本文')
        expect(tweet.title_valid?).to eq true
      end
    end

    context 'titleが16文字の場合' do
      it 'title_valid?がfalseになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: '0123456789ABCDEF', tweet_content: '本文')
        expect(tweet.title_valid?).to eq false
      end
    end
  end

  describe '#tweet_content_valid?' do
    context 'tweet_contentがnilの場合' do
      it 'tweet_content_valid?がfalseになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: 'タイトル', tweet_content: nil)
        expect(tweet.tweet_content_valid?).to eq false
      end
    end

    context 'tweet_contentが空文字列の場合' do
      it 'tweet_content_valid?がfalseになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: 'タイトル', tweet_content: '')
        expect(tweet.tweet_content_valid?).to eq false
      end
    end

    context 'tweet_contentが100文字の場合' do
      it 'tweet_content_valid?がtrueになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: 'タイトル', tweet_content: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789')
        expect(tweet.tweet_content_valid?).to eq true
      end
    end

    context 'tweet_contentが101文字の場合' do
      it 'tweet_content_valid?がfalseになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: 'タイトル', tweet_content: '01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890')
        expect(tweet.tweet_content_valid?).to eq false
      end
    end
  end

  describe '#valid?' do
    context 'titleが15文字かつtweet_contentが100文字の場合' do
      it 'valid?がtrueになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: '0123456789ABCDE', tweet_content: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789')
        expect(tweet.valid?).to eq true
      end
    end

    context 'titleがnilかつtweet_contentが100文字の場合' do
      it 'valid?がfalseになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: nil, tweet_content: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789')
        expect(tweet.valid?).to eq false
      end
    end

    context 'titleが15文字かつtweet_contentがnilの場合' do
      it 'valid?がfalseになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: '0123456789ABCDE', tweet_content: nil)
        expect(tweet.valid?).to eq false
      end
    end

    context 'titleがnilかつtweet_contentがnilの場合' do
      it 'valid?がfalseになる' do
        tweet = Tweet.new(id: 1, user_id: 1, title: nil, tweet_content: nil)
        expect(tweet.valid?).to eq false
      end
    end
  end

  describe '#output_error_messages' do
    context 'titleが15文字かつtweet_contentが100文字の場合' do
      it 'output_error_messageでnilが返る' do
        tweet = Tweet.new(id: 1, user_id: 1, title: '0123456789ABCDE', tweet_content: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789')
        tweet.valid?
        expect(tweet.output_error_messages).to eq nil
      end
    end

    context 'titleがnilかつtweet_contentがnilの場合' do
      it 'output_error_messageで「titleを入力して下さい。」「tweet_contentを入力して下さい。」が返る' do
        tweet = Tweet.new(id: 1, user_id: 1, title: nil, tweet_content: nil)
        tweet.valid?
        expect{tweet.output_error_messages}.to output("titleを入力して下さい。\ntweet_contentを入力して下さい。\n") .to_stdout
      end
    end

    context 'titleが16文字かつtweet_contentが101文字の場合' do
      it 'output_error_messageで「titleは15文字以内にして下さい。」「tweet_contentは100文字以内にして下さい。」が返る' do
        tweet = Tweet.new(id: 1, user_id: 1, title: '0123456789ABCDEF', tweet_content: '01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890')
        tweet.valid?
        expect{tweet.output_error_messages}.to output("titleは15文字以内にして下さい。\ntweet_contentは100文字以内にして下さい。\n") .to_stdout
      end
    end
  end
end