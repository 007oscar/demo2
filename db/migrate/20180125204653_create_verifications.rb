class CreateVerifications < ActiveRecord::Migration[5.1]
  def change
    create_table :verifications do |t|
      t.references :city, foreign_key: true
      t.datetime :fecha
      t.references :registry, foreign_key: true
      t.references :expedient, foreign_key: true
      t.boolean :incluye_expediente
      t.boolean :coincide_expediente
      t.boolean :incluye_anexos
      t.boolean :coinciden_anexos
      t.boolean :anexos_equipos_de_computo
      t.boolean :anexos_equipo_de_comunicacion
      t.boolean :anexos_material_fotografico
      t.boolean :anexos_disp_alm_elect
      t.boolean :anexos_componentes_electronicos
      t.boolean :otros
      t.references :expert, foreign_key: true

      t.timestamps
    end
  end
end
