class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :comments, as: :commentable

  validates :title, :article, :author_id, presence: true
  validates :title, length: {in: 1..20}
  validates :article, length: {in: 1..10000}
end
