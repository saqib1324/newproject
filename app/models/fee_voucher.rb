class FeeVoucher < ActiveRecord::Base

    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        all.each do |voucher|
          csv << voucher.name
          csv << voucher.voucher_no
          csv << "NOP Summer Coaching Session"
          csv << "-"
          csv << voucher.total_amount
        end
      end
    end
end
