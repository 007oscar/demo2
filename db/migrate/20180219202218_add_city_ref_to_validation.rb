class AddCityRefToValidation < ActiveRecord::Migration[5.0]
  def change
    add_reference :validations, :city, foreign_key: true
  end
end
