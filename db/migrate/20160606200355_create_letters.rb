class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.column  :boarder_letter_text, :mediumtext
      t.column :day_scholar_letter_text, :mediumtext
      t.timestamps null: false
    end
  end
end
