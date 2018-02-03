class Expedient < ApplicationRecord
  has_many :registries, dependent: :destroy, inverse_of: :expedient
  accepts_nested_attributes_for :registries, allow_destroy: true, :reject_if => :all_blank
  validates :expediente, presence: true
end
