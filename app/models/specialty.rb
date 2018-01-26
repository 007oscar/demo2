class Specialty < ApplicationRecord
  has_many :has_specialties
  has_many :experts, through: :has_specialties
end
