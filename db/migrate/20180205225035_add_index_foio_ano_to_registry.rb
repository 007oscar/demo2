class AddIndexFoioAnoToRegistry < ActiveRecord::Migration[5.0]
  def change
    add_index :registries, [:id, :folio, :year_folio], unique: true
  end
end
