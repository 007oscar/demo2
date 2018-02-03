class DropAuthorities < ActiveRecord::Migration[5.0]
  def change
    drop_table :authorities do |t|
      t.string :nombres
      t.string :apellidos
      t.references :title, foreign_key: true
      t.timestamps
    end
  end
end
