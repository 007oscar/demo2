class AddRelacionadoToExpedient < ActiveRecord::Migration[5.0]
  def change
    add_column :expedients, :relacionado, :integer
  end
end
