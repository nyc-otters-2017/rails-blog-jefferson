class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :bio, length: {maximum: 500}
  validates :location, length: {maximum: 20}
  validates :password, length: {in: 8..20}

  validate :valid_email

  def valid_email
    if !email.match(/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/)
      errors.add(:email, 'Email is not valid')
    end
  end

end
