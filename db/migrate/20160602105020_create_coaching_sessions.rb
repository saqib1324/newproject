class CreateCoachingSessions < ActiveRecord::Migration

  def up
    create_table :coaching_sessions do |t|
      t.string "name" , :limit => 50
      t.boolean "status", :null => false,:default => false
      t.timestamps null: false
    end
  end
  def down
    drop_table :coaching_sessions
  end
end
