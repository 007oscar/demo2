class RemoveExpedienteFromVerifications < ActiveRecord::Migration[5.0]
  def change
    remove_column :verifications, :incluye_expediente, :boolean
  end
end
