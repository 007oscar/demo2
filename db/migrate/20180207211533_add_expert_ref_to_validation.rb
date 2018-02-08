class AddExpertRefToValidation < ActiveRecord::Migration[5.0]
  def change
    add_reference :validations, :expert, foreign_key: true
  end
end
