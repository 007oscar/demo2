class Expedient < ApplicationRecord
  has_many :registries, dependent: :destroy
  validates :expediente, presence: true
  validates :expediente, uniqueness: true
end
