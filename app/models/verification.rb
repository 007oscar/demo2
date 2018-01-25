class Verification < ApplicationRecord
  belongs_to :city
  belongs_to :registry
  belongs_to :expedient
  belongs_to :expert
end
