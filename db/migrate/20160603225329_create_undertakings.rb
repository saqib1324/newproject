class CreateUndertakings < ActiveRecord::Migration
  def change
    create_table :undertakings, id: false do |t|
      t.string "tracking_id"
      t.boolean "status",:default => false
      t.boolean "admin_status",null: true
      t.string "file_name",:default => "null"
      t.column "data", "MEDIUMBLOB"
      t.string "mime_type",:default => "null"
      t.string "via"
      t.string :session
      t.timestamps null: false
    end
    execute "ALTER TABLE undertakings ADD PRIMARY KEY (tracking_id);"
  end
end
