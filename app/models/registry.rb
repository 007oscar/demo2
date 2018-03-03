class Registry < ApplicationRecord
  before_save :convertir_fecha_r
  before_save :convertir_fecha_e
  validate :relacionado, if: :existe_expediente
  validate :ciudad, if: :existe_ciudad

  belongs_to :expedient
  belongs_to :city
  belongs_to :authority
  belongs_to :result
  has_many :has_experts
  has_many :experts, through: :has_experts
  has_one :validation
  has_one :verification

  # attr_accessor :expedient

  #accepts_nested_attributes_for :expedient, :city, :authority, :expert, :result
  accepts_nested_attributes_for :expedient
  accepts_nested_attributes_for :city , :reject_if => :all_blank
  accepts_nested_attributes_for :authority , :reject_if => :all_blank
  accepts_nested_attributes_for :experts , :reject_if => :all_blank
  accepts_nested_attributes_for :result , :reject_if => :all_blank

  validates_uniqueness_of :folio, scope: :year_folio
  #validates_uniqueness_of :year_folio
  validates :experts, presence: true
  validates :authority, presence: true
  validates :expedient, presence: true
  validates :folio, presence: true
  validates :year_folio, presence: true
  # validates :expedient_id, presence: true
  validates_associated :expedient, presence: true
  validates_associated :authority, presence: true


  #fecha de recepcion
  # @fecha_r = ""
  # @fecha_e = ""
  # @hora_r = ""
  # @hora_e = ""

  def fecha_r
    @fecha_r.try(:fecha_recepcion).strftime("%d/%m/%Y")
  end

  def hora_r
    @hora_r.try(:fecha_recepcion).strftime("%I:%M %p")
  end

  def fecha_r=(date)
    # Change back to datetime friendly format
    @fecha_r = Date.parse(date).strftime("%d/%m/%Y") if date.present?
  end

  def hora_r=(time)
    # Change back to datetime friendly format
    @hora_r = Time.parse(time).strftime("%I:%M %p") if time.present?
  end

  # fecha de entrega
  def fecha_e
    @fecha_e.try(:fecha_entrega).strftime("%d/%m/%Y")
  end

  def hora_e
    @hora_e.try(:fecha_entrega).strftime("%I:%M %p")
  end

  def fecha_e=(date)
    # Change back to datetime friendly format
    @fecha_e = Date.parse(date).strftime("%d/%m/%Y") if date.present?
  end

  def hora_e=(time)
    # Change back to datetime friendly format
    @hora_e = Time.parse(time).strftime("%H:%M %p") if time.present?
  end

  #############
  def convertir_fecha_r
    self.fecha_recepcion = Time.parse( "#{@fecha_r} #{@hora_r}") if @fecha_r.present?
  end

  def convertir_fecha_e
    self.fecha_entrega = Time.parse( "#{@fecha_e} #{@hora_e}") if @fecha_e.present?
  end

  def expediente
    expedient.expediente if expedient.present?
  end

  def expediente=(expediente)
    self.expedient = Expedient.find_or_create_by(expediente: expediente) if expediente.present?
  end

  def relacionado
    if expedient.present?
      if expedient.relacionado.present?
        Expedient.find(expedient.relacionado).expediente
      end
    end
  end

  def relacionado=(relacionado)
    res = Expedient.find_by_expediente(relacionado)
    if res.present?
      self.expedient.update(relacionado: res.id)
    end
  end

  def existe_expediente
    res = Expedient.find_by_expediente(self.relacionado) if self.relacionado.present?
    if not res.present? and self.relacionado.present?
      self.errors.add(:relacionado, "El expediente relacionado debe existir")
    end
  end

  def ciudad
   if city.present?
     if city.ciudad.present? and city.estado.present?
       "#{city.ciudad}, #{city.estado}"
     end
   end
  end

  def ciudad=(ciudad)
    if ciudad.present?
      if ciudad.split(',').size == 2
        c = ciudad.split(',')[0].upcase
        e = ciudad.split(',')[-1].upcase.take_while{|c| c != ''}
        self.city = City.find_or_create_by(ciudad: c, estado: e) #if c.present? and e.present?
      end
    end
    @ciudad = ciudad
  end

  def existe_ciudad
    if @ciudad.present?
      if @ciudad.split(",").size != 2
        # self.ciudad = @ciudad
        self.errors.add(:ciudad, "Verifique que la ciudad y el estado esten separados por una coma ','.")
        self.city = nil
      end
    else
      self.errors.add(:ciudad, "Debe existir una ciudad.")
      self.city = nil
    end
  end
end
