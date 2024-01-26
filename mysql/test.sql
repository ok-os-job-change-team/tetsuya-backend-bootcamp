-- usersテーブルを作成
CREATE TABLE test.users (id INT AUTO_INCREMENT, name TEXT, PRIMARY KEY(id));

-- usersに挿入
INSERT INTO test.users(name) values('John'), ('Paul'), ('George'), ('Ringo');

-- usersテーブルの内容を表示
SELECT * FROM users;