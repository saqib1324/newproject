class CreateVoucherNos < ActiveRecord::Migration
  def change
    create_table :voucher_nos do |t|
      t.string :voucher_no
      t.timestamps null: false
    end
  end
end
