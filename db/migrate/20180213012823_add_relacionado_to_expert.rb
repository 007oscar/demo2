class AddRelacionadoToExpert < ActiveRecord::Migration[5.0]
  def change
    add_column :experts, :relacionado, :integer
  end
end
