class AddDetenidoToRegistry < ActiveRecord::Migration[5.0]
  def change
    add_column :registries, :detenido, :boolean
  end
end
