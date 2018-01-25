class CreateAuthorities < ActiveRecord::Migration[5.1]
  def change
    create_table :authorities do |t|
      t.string :nombres
      t.string :apellidos
      t.references :title, foreign_key: true

      t.timestamps
    end
  end
end
