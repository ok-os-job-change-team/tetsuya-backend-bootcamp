-- usersテーブルを作成
CREATE TABLE test.users (id INT AUTO_INCREMENT, name TEXT, PRIMARY KEY(id));

-- usersに挿入
INSERT INTO test.users(name) values('John');
INSERT INTO test.users(name) values('Paul');
INSERT INTO test.users(name) values('George');
INSERT INTO test.users(name) values('Ringo');