class CreateHasSpecialties < ActiveRecord::Migration[5.1]
  def change
    create_table :has_specialties do |t|
      t.references :expert, foreign_key: true
      t.references :specialty, foreign_key: true

      t.timestamps
    end
  end
end
