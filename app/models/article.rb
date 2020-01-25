class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 1, maximum: 80}
  validates :description, presence: true, length: {minimum: 1, maximum: 10000 }
end
