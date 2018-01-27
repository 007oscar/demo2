class AddTitleRefToExpert < ActiveRecord::Migration[5.1]
  def change
    add_reference :experts, :title, foreign_key: true
  end
end
