class News < ApplicationRecord
  validates :url, uniqueness: true
  validates :body, presence: true
end
