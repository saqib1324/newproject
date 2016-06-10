class CreateVoucherMappings < ActiveRecord::Migration
  def change
    create_table :voucher_mappings,id: false do |t|
      t.string "voucher_no"
      t.string "tracking_id",null: true,unique: true
      t.string "session"
      t.timestamps null: false
    end
    execute "ALTER TABLE voucher_mappings ADD PRIMARY KEY (voucher_no);"
  end
  
end
