class Specialty < ApplicationRecord
  has_many :has_specialties, dependent: :destroy
  has_many :experts, through: :has_specialties
end
