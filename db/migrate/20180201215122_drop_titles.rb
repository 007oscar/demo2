class DropTitles < ActiveRecord::Migration[5.0]
  def change
    drop_table :titles do |t|
      t.string :titulo
      t.timestamps
    end
  end
end
