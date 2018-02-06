class RemoveExpertRefFromRegistry < ActiveRecord::Migration[5.0]
  def change
    remove_reference :registries, :expert, foreign_key: true
  end
end
