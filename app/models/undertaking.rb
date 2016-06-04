class Undertaking < ActiveRecord::Base
    def self.create_mail(id)
        @undertaking = Undertaking.new do |t|
            t.tracking_id = id
            t.via = "Mail"
            t.data      = "NULL"
            t.session = CoachingSession.where(:status => true).take.name
            t.admin_status = true
            t.status = true
        end
        @undertaking.save!
    end
    
end
