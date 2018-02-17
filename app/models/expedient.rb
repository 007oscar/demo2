class Expedient < ApplicationRecord
  has_many :registries, dependent: :destroy
  validates :expediente, presence: true
  validates :expediente, uniqueness: true
  # validates :registries, presence: {message: "Debe haber un registro"}   #para asegurar que este en un registro
  #                                           #asi cuando se ordene en la lista no marque error por las relaciones

end
