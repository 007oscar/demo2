class Expert < ApplicationRecord
  has_many :has_specialties
  has_many :specialties, through: :has_specialties
end
