class DayscholarPdf < Prawn::Document
   def initialize()
        # require 'prawn/tables'
        super :page_size => "A4", :page_layout => :portrait,:margin => [50, 70, 20]
        session = CoachingSession.where(:status => true).take
        students = Student.where(:session => session.name,:boarder => false)
        @students=students
        iterate
   end
   def iterate
     @students.each do |student|
       make_file(student)
       start_new_page
      end
   end
   def make_file(student)
        move_down 65
        # indent(10) do
          text "June 10th,2016",inline_format: true,:size => 11
          move_down 10
          text "#{student.name.titleize()}",inline_format: true,:size => 11
          if student.address1
            text "#{student.address1.titleize()}",inline_format: true,:size => 11
          end
          if student.address2 and student.address3
            text "#{student.address2.titleize()},#{student.address3.titleize()}",inline_format: true,:size => 11
          elsif student.address2 and not student.address3
            text "#{student.address2.titleize()}",inline_format: true,:size => 11
          end
          text "#{student.city.titleize()},#{student.province.titleize()}",inline_format: true,:size => 11
          if student.mobile_number and student.phone_number
            text "Contact #: #{student.mobile_number}/#{student.phone_number}",inline_format: true,:size => 11
          elsif student.mobile_number and not student.phone_number
            text "Contact #: #{student.mobile_number}",inline_format: true,:size => 11
          elsif student.phone_number and not student.mobile_number
            text "Contact #: #{student.phone_number}",inline_format: true,:size => 11
          end
        # end
        move_down 20
        indent(5) do
          text "<b><u>Invitation for Participation at the LUMS Summer Coaching Session (SCS) 2016 
          for NOP Prospects</u></b>",:size => 12,:inline_format => true,:align => :center
        end
        # indent(10) do
          move_down 17
          text "Dear #{student.name.titleize()},",:size => 11,:inline_format => true
          move_down 10
          text "We are pleased to announce that you have been selected to attend the coaching session at LUMS campus from <b>Monday,18th july 2016 to Monday,1st August, 2016.</b>",:size => 11,:inline_format => true
          move_down 10
          text "<b>The NOP ID assigned to you is #{student.tracking_id}. It is a unique ID which will be used to track your application throughout the admission process.</b>",:size => 11,:inline_format => true
          move_down 10
          text "We have created your online accounts on a web based application which is easily accessible through your mobile phones/ PCs/ Laptops from your homes/ colleges. To log on use the following link: www.nopscs.lums.edu.pk. ",:size => 11,:inline_format => true
          move_down 10
          text "Through your account, you will be able to download your invitation letter, payment voucher and submit your online confirmation to attend the session. After making payment of the requisite amount (as stated on your fee voucher), you 
          will be required to upload a scanned copy of your payment receipt so that we are aware of your payment status before you come to LUMS. The username and password is given below for your record.",:size => 11,:inline_format => true
          move_down 10
          text "Username:	#{student.username}
          Password:	#{student.secondary_tracking}",:size => 11,:inline_format => true
          move_down 10
          text "For instructions on how to accept your invitation to the LUMS NOP Summer Coaching Session 2016, please refer to the document titled “How to Accept your NOP SCS Invitation” (printed on a green sheet). ",:size => 11,:inline_format => true
         
            move_down 10
            text "Your reporting time is 11:00 AM on <b>Monday, July 18th 2016 (late comers will not be allowed to register).</b> Your registration shall start at 11:00 AM till 12:00 PM and you will be required to attend the orientation session at 03:00 PM.",:size => 11,:inline_format => true
          
          move_down 10
          text "We have also enclosed some general guidelines, which you are required to read carefully so that your stay at LUMS is comfortable.",:size => 11,:inline_format => true
          start_new_page
          move_down 50
          text "<b><u>Notes:</u>
          •	Please bring this offer letter with you on Monday, July 18th 2016 along with a photo bearing identity (CNIC or your College ID Card)</b>
          •	Parents / guardians will not be allowed to enter/ stay the premises of LUMS
          •	LUMS has a zero tolerance policy for harassment and misconduct/ misbehavior of any form. Violation of any guidelines/ rules (whether written or verbal) will lead to disqualification from the session.
          •	You are solely responsible for your belongings. LUMS will bear no responsibility for any loss or damage.
          •	No hostel facility/ TA will be provided to candidates coming from Lahore.
          •	Applicants from outside of Lahore will be required to stay on campus throughout the tenure of the coaching session and will not be allowed to leave before the completion of the session.",:size => 11,:inline_format => true
          move_down 10
          text "For any queries feel free to contact any of the given numbers. Sadia Babar: 042-35608262/ Sharjeel Muazzam: 042-35608438 / Shajia Shoaib: 042-35608204 / 
          Momin Sharif: 042-35608000 (Ext. 2419). ",:size => 11,:inline_format => true
          move_down 10
          text "We look forward to welcoming you at LUMS. ",:size => 11,:inline_format => true
          move_down 10
          text "<b>Please note that this is not an admission offer letter.</b> ",:size => 11,:inline_format => true
          move_down 10
          text "Best Regards,",:size => 11,:inline_format => true
          move_down 10
          text "Shandana Mehdi,
          Deputy Manager - NOP Centre
          Lahore University of Management Sciences (LUMS)",:size =>11,:inline_format => true
          
          move_down 30
          
            text "<b><u>Enclosures:</u></b>
            1.Mailing Label | 2.Undertaking Form | 3.How to accept your NOP SCS Invitation | 4.Mailing Label",:size =>11,:inline_format => true
        
        
        # end

   end
   
end 
