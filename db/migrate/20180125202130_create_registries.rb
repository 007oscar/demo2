class CreateRegistries < ActiveRecord::Migration[5.1]
  def change
    create_table :registries do |t|
      t.integer :consecutivo
      t.integer :folio
      t.integer :year_folio
      t.references :expedient, foreign_key: true
      t.references :city, foreign_key: true
      t.references :authority, foreign_key: true
      t.text :anexos_recibidos
      t.datetime :fecha_recepcion
      t.references :expert, foreign_key: true
      t.datetime :fecha_entrega
      t.references :result, foreign_key: true
      t.text :anexos_entregados
      t.text :observaciones

      t.timestamps
    end
  end
end
