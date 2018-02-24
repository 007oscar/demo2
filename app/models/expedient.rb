class Expedient < ApplicationRecord
  has_many :registries, dependent: :destroy
  # after_save :revisar_relacionado

  validates :expediente, presence: true #, format: {with: /\AFED.*\d{7}\/\d{4}\z/, message: "Verifica que el numero de expediente tenga 7 digitos y el año 4."}
  validates :expediente, uniqueness: true
  # validates :registries, presence: {message: "Debe haber un registro"}   #para asegurar que este en un registro
  #                                           #asi cuando se ordene en la lista no marque error por las relaciones

  def nombre_expediente
    expediente.try(:nombre)
  end

  def nombre_expediente=(nombre)
    self.expediente = Expedient.find_or_create_by(expediente: nombre).expediente if nombre.present?
  end

  def expediente_relacionado
    relacionado.try(:nombre)
  end

  def expediente_relacionado=(nombre)
    if nombre.present?
      if Expedient.find_by_expediente(nombre).present?
        self.relacionado = Expedient.find_by_expediente(nombre).id
      else
        raise Exception.new('something bad happened!')
      end
    end
  end

  def revisar_relacionado
    if expediente_relacionado.present?
      if not Expedient.find_by_expediente(nombre).present?
        raise Exception.new('something bad happened!')
        #false
      else
        self.relacionado = Expedient.find_by_expediente(nombre).id
      #  true
      end
    end
  end
end
