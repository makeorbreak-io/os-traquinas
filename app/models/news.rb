class News < ApplicationRecord
  validates :url, uniqueness: true
end
