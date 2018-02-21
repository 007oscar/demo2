class Validation < ApplicationRecord
  belongs_to :registry
  belongs_to :expert
  belongs_to :city

  accepts_nested_attributes_for :registry
  accepts_nested_attributes_for :expert
  accepts_nested_attributes_for :city

  validates_uniqueness_of :registry_id, scope: :expert_id

  validates :expert, presence: true
  validates :registry, presence: true
  validates :registry, uniqueness: true

end