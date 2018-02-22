class Expedient < ApplicationRecord
  has_many :registries, dependent: :destroy
  validates :expediente, presence: true #, format: {with: /\AFED.*\d{7}\/\d{4}\z/, message: "Verifica que el numero de expediente tenga 7 digitos y el año 4."}
  validates :expediente, uniqueness: true
  # validates :registries, presence: {message: "Debe haber un registro"}   #para asegurar que este en un registro
  #                                           #asi cuando se ordene en la lista no marque error por las relaciones
end
