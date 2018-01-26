class HasSpecialty < ApplicationRecord
  belongs_to :expert
  belongs_to :specialty
end
