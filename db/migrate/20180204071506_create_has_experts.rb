class CreateHasExperts < ActiveRecord::Migration[5.0]
  def change
    create_table :has_experts do |t|
      t.references :expert, foreign_key: true
      t.references :registry, foreign_key: true

      t.timestamps
    end
  end
end
