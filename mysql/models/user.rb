class User
  attr_accessor :email, :password, :updated_at
  attr_reader :id, :created_at

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
    @created_at = Time.now
    @updated_at = Time.now
  end

  def present?
    @id != nil
  end
end