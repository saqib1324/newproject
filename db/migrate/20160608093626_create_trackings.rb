class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings, id: false  do |t|
      t.string "tracking_id"
      t.string "name"
      t.boolean "accepted",:default => false
      t.boolean "downloaded",null: true
      t.string "session"
      t.timestamps null: false
    end
    execute "ALTER TABLE trackings ADD PRIMARY KEY (tracking_id);"
  end
end
