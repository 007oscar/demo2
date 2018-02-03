class DropExpert < ActiveRecord::Migration[5.0]
  def change
    drop_table :experts do |t|
      t.string   "nombres"
      t.string   "apellidos"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "title_id"
      t.index ["title_id"], name: "index_experts_on_title_id"
    end
  end
end
