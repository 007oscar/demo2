class AddNumExpedienteToRegistry < ActiveRecord::Migration[5.0]
  def change
    add_column :registries, :num_expediente, :string
  end
end
