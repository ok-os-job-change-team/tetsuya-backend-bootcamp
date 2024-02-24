-- favoritesテーブルを作成
CREATE TABLE favorites (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL,
  tweet_id INT NOT NULL,
  FOREIGN KEY fk_user_id(user_id) REFERENCES users(id), -- user_idカラムとusersテーブルのidカラムを紐付け
  FOREIGN KEY fk_tweet_id(tweet_id) REFERENCES tweets(id) -- tweet_idカラムとtweetsテーブルのidカラムを紐付け
);