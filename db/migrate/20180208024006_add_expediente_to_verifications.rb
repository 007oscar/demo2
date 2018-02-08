class AddExpedienteToVerifications < ActiveRecord::Migration[5.0]
  def change
    add_column :verifications, :incluye_expediente, :integer
  end
end
