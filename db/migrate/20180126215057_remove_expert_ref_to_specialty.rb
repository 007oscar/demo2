class RemoveExpertRefToSpecialty < ActiveRecord::Migration[5.1]
  def change
    remove_reference :specialties, :expert, foreign_key: true
  end
end
