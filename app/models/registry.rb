class Registry < ApplicationRecord
  belongs_to :expedient
  belongs_to :city
  belongs_to :authority
  belongs_to :expert
  belongs_to :result
end
