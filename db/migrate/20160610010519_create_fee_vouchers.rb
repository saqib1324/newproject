class CreateFeeVouchers < ActiveRecord::Migration
  def change
    create_table :fee_vouchers do |t|
      t.string "name"
      t.string "voucher_no"
      t.string "tracking_id"
      t.string "total_amount"
      t.string "status"
      t.string "payment_deadline"
      t.string "mobile_number",null: true
      t.string "phone_number",null: true
      t.string "email",null: true
      t.timestamps null: false
    end
  end
end
