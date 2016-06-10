class VoucherMapping < ActiveRecord::Base
    require 'roo'
    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
          csv << column_names
          all.each do |voucher|
              csv << voucher.attributes.values_at(*column_names)
          end
      end
    end
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        if spreadsheet
            header = spreadsheet.row(1)
            (2..spreadsheet.last_row).each do |i|
                row = Hash[[header, spreadsheet.row(i)].transpose]
                voucher = find_by_tracking_id(row["tracking_id"]) || new
                voucher.attributes = row.to_hash.slice(*row.to_hash.keys)
                voucher.session = CoachingSession.where(:status => true).take.name
                voucher.save!
            end
        end
        
        
    end
    
    def self.open_spreadsheet(file)
        if file
            case File.extname(file.original_filename)
            when ".csv" then Csv.new(file.path, nil, :ignore)
            when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
            when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
            else raise "Unknown file type: #{file.original_filename}"
            end
        end
    end

end
