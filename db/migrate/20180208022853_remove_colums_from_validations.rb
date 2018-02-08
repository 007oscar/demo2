class RemoveColumsFromValidations < ActiveRecord::Migration[5.0]
  def change
    remove_column :verifications,:ncluye_expediente, :boolean
    remove_column :verifications,:coincide_expediente, :boolean
    remove_column :verifications,:incluye_anexos, :boolean
    remove_column :verifications,:coinciden_anexos, :boolean
    remove_column :verifications,:anexos_equipos_de_computo, :boolean
    remove_column :verifications,:anexos_equipo_de_comunicacion, :boolean
    remove_column :verifications,:anexos_material_fotografico, :boolean
    remove_column :verifications,:anexos_disp_alm_elect, :boolean
    remove_column :verifications,:anexos_componentes_electronicos, :boolean
    remove_column :verifications,:otros, :boolean
  end
end
