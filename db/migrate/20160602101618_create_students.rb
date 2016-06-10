class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students,id: false do |t|
      t.string "name"
      t.string "father_name", null: true
      t.string "tracking_id"
      t.string "session"
      t.string "stream", null: true
      t.string "m_o_level_stream"
      t.string "graduation_year", null: true
      t.float "matric_percentage", null: true
      t.string "o_level_grades", null: true
      t.string "DOB", null: true
      t.string "gender", null: true
      t.string "secondary_tracking"
      t.string "address1"
      t.string "address2", null: true
      t.string "address3", null: true
      t.string "city", null: true
      t.string "district", null: true
      t.string "province"
      t.string "mobile_number", null: true
      t.string "phone_number", null: true
      t.integer "monthly_income"
      t.string "income_range", null: true
      t.boolean "boarder", null: true
      t.string "email", null: true
      t.string "username"
      t.string "password_digest"
      t.timestamps null: false
    end
    execute "ALTER TABLE students ADD PRIMARY KEY (tracking_id);"
  end
  def down
    drop_table :students
  end
end
