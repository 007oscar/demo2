class CreateExpedients < ActiveRecord::Migration[5.1]
  def change
    create_table :expedients do |t|
      t.string :expediente
      t.integer :hojas
      t.integer :a_inicial
      t.integer :a_final
      t.integer :hojas

      t.timestamps
    end
  end
end
