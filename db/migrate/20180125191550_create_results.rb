class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :resultado

      t.timestamps
    end
  end
end
