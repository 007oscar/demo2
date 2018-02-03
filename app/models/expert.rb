class Expert < ApplicationRecord
  has_many :has_specialties, dependent: :destroy
  has_many :specialties, through: :has_specialties # inverse_of: :Expert
  accepts_nested_attributes_for :specialties, :reject_if => :all_blank, :allow_destroy => true
  #
  validates :specialties, presence: true
end
