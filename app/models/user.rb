require 'mysql2'

class User
  attr_reader :id, :email, :password, :created_at,  :updated_at

  def initialize(id:, email:, password:)
    @id = id
    @email = email
    @password = password
    @created_at = Time.now
    @updated_at = Time.now
  end

  def present?
    @id != nil
  end

  def self.all
    # usersテーブルのレコードを全て取得する

    client = Mysql2::Client.new(
      host: 'db', # Docker composeのサービス名をホストとして指定する
      username: 'root',
      password: 'root',
      database: 'test'
    )

    client.query('SELECT * FROM users').each do |e1|
    end
  end
end