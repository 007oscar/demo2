class Registry < ApplicationRecord
  belongs_to :expedient
  belongs_to :city
  belongs_to :authority
  belongs_to :result
  has_many :has_experts
  has_many :experts, through: :has_experts

  #accepts_nested_attributes_for :expedient, :city, :authority, :expert, :result
  accepts_nested_attributes_for :expedient , :reject_if => :all_blank
  accepts_nested_attributes_for :city , :reject_if => :all_blank
  accepts_nested_attributes_for :authority , :reject_if => :all_blank
  accepts_nested_attributes_for :experts , :reject_if => :all_blank
  accepts_nested_attributes_for :result , :reject_if => :all_blank

  validates_uniqueness_of :folio, scope: :year_folio
  #validates_uniqueness_of :year_folio
  validates :experts, presence: true

  validates :folio, presence: true
  validates :year_folio, presence: true
  validates :expedient_id, presence: true

end
