class Expert < ApplicationRecord
  belongs_to :title
  has_many :has_specialties
  has_many :specialties, through: :has_specialties
end
