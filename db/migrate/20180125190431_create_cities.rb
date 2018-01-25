class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :ciudad
      t.string :estado

      t.timestamps
    end
  end
end
