class Authority < ApplicationRecord
  has_many :registries
  validates :nombre, presence: true
  validates :puesto, presence: true
end
