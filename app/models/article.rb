class Article < ApplicationRecord
  validates :title presence: true, length: {minimum: 3, maximum: 80}
  validates :description presence: true, length: {minimum: 10, maximum: 10000 }
end
