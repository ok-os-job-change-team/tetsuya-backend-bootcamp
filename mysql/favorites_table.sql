-- Favoritesテーブルを作成
CREATE TABLE Favorites (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL,
  tweet_id INT NOT NULL,
  FOREIGN KEY fk_user_id(user_id) REFERENCES Users(id), -- user_idカラムとUsersテーブルのidカラムを紐付け
  FOREIGN KEY fk_tweet_id(tweet_id) REFERENCES Tweets(id) -- tweet_idカラムとTweetsテーブルのidカラムを紐付け
);