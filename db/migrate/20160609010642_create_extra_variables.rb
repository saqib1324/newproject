class CreateExtraVariables < ActiveRecord::Migration
  def change
    create_table :extra_variables do |t|
      t.string "voucher_no"
      t.string "deadline"
      t.timestamps null: false
    end
  end
end
