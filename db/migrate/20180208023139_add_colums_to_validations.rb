class AddColumsToValidations < ActiveRecord::Migration[5.0]
  def change
    add_column :verifications,:ncluye_expediente, :integer
    add_column :verifications,:coincide_expediente, :integer
    add_column :verifications,:incluye_anexos, :integer
    add_column :verifications,:coinciden_anexos, :integer
    add_column :verifications,:anexos_equipos_de_computo, :integer
    add_column :verifications,:anexos_equipo_de_comunicacion, :integer
    add_column :verifications,:anexos_material_fotografico, :integer
    add_column :verifications,:anexos_disp_alm_elect, :integer
    add_column :verifications,:anexos_componentes_electronicos, :integer
    add_column :verifications,:otros, :integer
  end
end
