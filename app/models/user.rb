class User < ApplicationRecord
  validates :name, presence: true
  validates :bio, length: {maximum: 500}
  validates :location, length: {maximum: 20}
end
