class Book < ApplicationRecord
  has_many :authorbooks
  has_many :authors, through: :authorbooks
end
