class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :marks, dependent: :destroy
  validates :title, presence: true, length: {minimum: 4}
end
