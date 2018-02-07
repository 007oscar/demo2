class Result < ApplicationRecord
  has_many :registries
  validates :resultado, uniqueness: true
end
