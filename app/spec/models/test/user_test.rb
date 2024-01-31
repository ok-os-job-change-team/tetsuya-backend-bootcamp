require 'minitest/autorun'
require_relative '../user'

class UserTest < Minitest::Test
  # 情報が過不足ないuser
  def test_user1
    john = User.new(1, 'john@example.com', 'p@ssw0rd1')
    assert john.present? # 結果が真であれば成功
  end

  # idがnilのuser
  def test_user2
    paul = User.new(nil, 'paul@example.com', 'p@ssw0rd2')
    refute paul.present? # 結果が偽であれば成功
  end
end