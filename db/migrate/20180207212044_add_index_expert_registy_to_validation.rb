class AddIndexExpertRegistyToValidation < ActiveRecord::Migration[5.0]
  def change
    add_index :validations, [:expert_id, :registry_id], unique: true
  end
end
