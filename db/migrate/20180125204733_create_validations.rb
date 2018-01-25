class CreateValidations < ActiveRecord::Migration[5.1]
  def change
    create_table :validations do |t|
      t.references :registry, foreign_key: true
      t.string :nombres
      t.string :apellidos

      t.timestamps
    end
  end
end
