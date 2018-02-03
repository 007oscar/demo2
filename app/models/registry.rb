class Registry < ApplicationRecord
  belongs_to :expedient
  belongs_to :city
  belongs_to :authority
  belongs_to :expert
  belongs_to :result

  #accepts_nested_attributes_for :expedient, :city, :authority, :expert, :result
  accepts_nested_attributes_for :expedient , :reject_if => :all_blank
  accepts_nested_attributes_for :city , :reject_if => :all_blank
  accepts_nested_attributes_for :authority , :reject_if => :all_blank
  accepts_nested_attributes_for :expert , :reject_if => :all_blank
  accepts_nested_attributes_for :result , :reject_if => :all_blank

  validates :folio, presence: true

end
