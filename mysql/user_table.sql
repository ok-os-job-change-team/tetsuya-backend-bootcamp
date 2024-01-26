-- usersテーブルを作成
CREATE TABLE users (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  email VARCHAR(50),
  password VARCHAR(20),
  created_at DATETIME,
  updated_at DATETIME
  );

-- usersに挿入
INSERT INTO users
  (id, email, password, created_at, updated_at)
values
  (1, 'hoge@example.com', 'hogehoge', '2024-01-01 01:11:11', '2024-01-01 01:11:11'),
  (2, 'piyo@example.com', 'piyopiyo', '2024-01-02 02:22:22', '2024-01-02 02:22:22'),
  (3, 'foo@example.com', 'foofoo', '2024-01-03 03:33:33', '2024-01-03 03:33:33'),
  (4, 'bar@example.com', 'barbar', '2024-01-04 04:44:44', '2024-01-04 04:44:44');

-- usersテーブルの内容を表示
SELECT * FROM users;