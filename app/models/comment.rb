class Comment < ApplicationRecord
  belongs_to :post

  validates :username, presence: true, length: {minimum: 4, maximum: 250}
  validates :body, presence: true, length: {minimum:5, maximum: 500}
end
