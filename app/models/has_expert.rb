class HasExpert < ApplicationRecord
  belongs_to :expert
  belongs_to :registry
end
