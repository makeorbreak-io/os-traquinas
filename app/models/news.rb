class News < ApplicationRecord
  validates :email, uniqueness: true
end
