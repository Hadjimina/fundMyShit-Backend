class User < ApplicationRecord
  has_many :challenges, foreign_key: 'challenger_id'
  has_many :payments, foreign_key: 'payer_id'
  has_many :payed_challenges, through: :payments, source: :challenge

  validates :email, uniqueness: true
  validates :username, uniqueness: true
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
