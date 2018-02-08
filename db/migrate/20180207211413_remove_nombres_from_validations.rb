class RemoveNombresFromValidations < ActiveRecord::Migration[5.0]
  def change
    remove_column :validations, :nombres, :string
    remove_column :validations, :apellidos, :string
  end
end
