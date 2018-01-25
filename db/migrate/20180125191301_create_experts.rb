class CreateExperts < ActiveRecord::Migration[5.1]
  def change
    create_table :experts do |t|
      t.string :nombres
      t.string :apellidos

      t.timestamps
    end
  end
end
