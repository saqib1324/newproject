class StudentVoucherPdf < Prawn::Document
   def initialize(student,session_,voucher)
        # require 'prawn/tables'
        super :page_size => "A4", :page_layout => :landscape
        @student=student
        @active_session=session_
        @voucher = voucher
        border
   end
   
   def header
        pad(5){
            indent(5) do
                image "#{Rails.root}/app/assets/images/lums.png", width: 43, height: 30
            end
            move_up 30
            indent(45) do
                text 'Fee Voucher', :size =>10
                move_up 11
                indent (140) do
                    text "<u>Bank Copy</u>", :inline_format => true, :size => 10,:style => :bold
                end
                move_down 5
                indent (4) do
                    text "Lahore University of Management Sciences", :size => 10, :style => :bold, :inline_format => true
                end
            end
            infotext
            indent (10) do
                move_down 10
                text"<b>Description                                                        PKR</b>", :inline_format => true, :size => 10
                move_up 19
                table([ ["", ""],
                ["Hostel Security (Refundable)", "1,700"],
                ["Laundry Charges", "500"],
                ["", ""]]) do
                    row(0).style( :size => 9, :height => 20,:align => :center,:align => :left)
                    row(1..2).style( :size => 9, :height => 20,:align => :center,:align => :left)
                    row(3).style( :size => 9, :height => 20,:align => :center,:align => :left)
                            
                    column(0).style( :size => 9, :width => 150)
                    column(1).style( :size => 9, :width => 90, :align => :right)
                end
                move_up 12
                text"<b>Total Payable                                                     2,200</b>", :inline_format => true, :size => 10
                text "\n" 
            end #indent end
            bounding_box([10,200], :width => 240, :height => 13) do
                transparent (0.7){
                    stroke_bounds
                }
                indent(10) do
                    move_down 2
                    
                    text "<b>Payment Deadline: June 29, 2016</b>",:size => 10,:align => :center, :inline_format => true
                end
                # header
            end
            move_down 140
            # bounding_box([10,30], :width => 240, :height => 15) do
            #     transparent (0.7){
            #         stroke_bounds
            #     }
            #     indent(7) do
            #         move_down 3
            #         text "<b>ABL Bank Account Number:  0010008710020029</b>", :inline_format => true,:align => :center, :size => 10
            #     end
            #     # header
            # end
            text "<u><b>Bank Account Number: ABL</b></u>", :inline_format => true, :size => 9
            table ([["0","0","1","0","0","0","8","7","1","0","0","2","0","0","2","9"]]) do
                # :style(:cells,:size => 9)
            end
            move_down 5
            text "This is computer generated voucher and does not need signature or stamp", :inline_format => true, :size => 7,:align => :center
            }
    end
    def header1
        pad(5){
            indent(5) do
                image "#{Rails.root}/app/assets/images/lums.png", width: 43, height: 30
            end
            move_up 30
            indent(45) do
                text 'Fee Voucher', :size =>10
                move_up 11
                indent (140) do
                    text "<u>Student Copy</u>", :inline_format => true, :size => 10,:style => :bold
                end
                move_down 5
                indent (4) do
                    text "Lahore University of Management Sciences", :size => 10, :style => :bold, :inline_format => true
                end
            end
      
            infotext
            indent (10) do
                move_down 13
                text"<b>Description                                                        PKR</b>", :inline_format => true, :size => 10
                move_up 19
                table([ ["", ""],
                ["Hostel Security (Refundable)", "1,700"],
                ["Laundry Charges", "500"],
                ["", ""]]) do
                    row(0).style( :size => 9, :height => 20,:align => :center,:align => :left)
                    row(1..2).style( :size => 9, :height => 20,:align => :center,:align => :left)
                    row(3).style( :size => 9, :height => 20,:align => :center,:align => :left)
                            
                    column(0).style( :size => 9, :width => 150)
                    column(1).style( :size => 9, :width => 90, :align => :right)
                end
                move_up 12
                text"<b>Total Payable                                                     2,200</b>", :inline_format => true, :size => 10
                text "\n"
            end
            bounding_box([10,200], :width => 240, :height => 13) do
                transparent (0.7){
                    stroke_bounds
                }
                indent(10) do
                    move_down 2
                    
                    text "<b>Payment Deadline: June 29, 2016</b>",:size => 10,:align => :center, :inline_format => true
                end
                # header
            end
            move_down 140
            # bounding_box([10,30], :width => 240, :height => 15) do
            #     transparent (0.7){
            #         stroke_bounds
            #     }
            #     indent(7) do
            #         move_down 3
            #         text "<b>ABL Bank Account Number:  0010008710020029</b>", :inline_format => true,:align => :center, :size => 10
            #     end
            # end
            text "<u><b>Bank Account Number: ABL</b></u>", :inline_format => true, :size => 9
            table ([["0","0","1","0","0","0","8","7","1","0","0","2","0","0","2","9"]]) do
            end
            move_down 5
            text "This is computer generated voucher and does not need signature or stamp", :inline_format => true, :size => 7,:align => :center
           }
    end
    def border
        bounding_box([-20,540], :width => 269, :height => 480) do
            transparent (0.5){stroke_bounds}
            header
        end
     
        bounding_box([250,540], :width => 269, :height => 480) do
            transparent (0.5){stroke_bounds}
            header1
        end
     
     
        bounding_box([590,540], :width => 110, :height => 12) do
            transparent (0.5){stroke_bounds}
           
    
            indent(8) do
                move_down 2
                text "<b>Important Information</b>",:size => 9, :inline_format => true
            end
            # header
        end
        bounding_box([260+260,540], :width => 260, :height=> 480) do
            transparent (0.5){stroke_bounds}
            # header
            move_down 15
            indent (5) do
                text "<u><b>Validation:</b></u>", :size=> 9, :inline_format => true
            end
            indent (15) do
                text "•	This Voucher is valid till: June 29,2016", :size=> 9, :inline_format => true
            end
            move_down 15
            indent (5) do
                text "<u><b>Mode of payment:</b></u>", :size=> 9, :inline_format => true
            end
            # text "Voucher can be paid through cash, Pay order and Bank Drafts made in favor of \"Lahore University of Management Sciences\" at" +
            # " any branch of Allied Bank Limited within Pakistan.", :size => 10
            # text "For online credit/card payment, please visit https://pay.lums.edu.pk"
            
            
            i=1
  
            text "\n"
            ["Voucher can be paid through cash, Pay order and Bank Drafts made in favor of \"Lahore University of Management Sciences\" at" +
            " any branch of Allied Bank Limited within Pakistan.","For online credit/card payment please visit http:// pay.lums.edu.pk","Vouchers" + 
            " can also be paid through ATM machines and internet banking portals of the following banks:"].each() do |list_item|

  
            float do
                bounding_box [28,cursor], :width => 20 do
                  text "   #{i}\.  ", :size => 10
                   i = i + 1
                end
            end

  
            bounding_box [50,cursor], :width => 208 do
                text list_item, :size => 9
                text "\n"
            end
              


            end#list_item end
           i=1 
            move_up 10
            ["Allied Bank Limited",
            "Askari Bank Limited",
            "Bank Alfalah Limited",
            "Meezan Bank Limited",
            "Standard Chartered (Only for online payments)",
            "Bank Al-Habib",
            ].each() do |list_item2|

          #create a bounding box for the list-item label
          #float it so that the cursor doesn't move down
                # move_up 5
                  float do
                    bounding_box [50,cursor], :width => 13,:height =>10 do
                      text "#{i}. ", :size => 9
                      i=i+1
                    end
                  end
                
                  #create a bounding box for the list-item content
                  bounding_box [60,cursor], :width => 600, :height => 10 do
                    #   move_up 5
                    text list_item2, :size => 9
                    # move_up 5
                  end
                
                  #provide a space between list-items
                #   move_down(5)
            
            end #list item 2 end
            
            
        indent(6) do
            text "Note:",:style => :bold, :size => 9
            text "For making payments through internet banking portals/ATM, students need to have bank account in respective bank.",:inline_format => true, :size => 9
        end        
      
        indent(5) do
            
            text "\nFor more details regarding mode of Payment as mentioned above, please visit http:// lums.edu.pk/student-payments ", :size => 9
            text "\n<b><u>Advance Tax:</u></b>", :size => 9, :inline_format => true
            text "Through an amendment in the income tax ordinance 2001 by finance Act 2013 Advance Tax (under section  2361)"+
            "shall be collected @ 5% on entire amount of fee except refundable portion.", :size => 9
        end
        
         indent(5) do
            
            text "\n<b><u>ABL Helpline Numbers:</u></b>", :size => 9, :inline_format => true
            text "1- Head Office (92-42-35909132) (Muhammad Irfan/Ali Haider)", :size => 9
            text "2- Region Office (92-42-35747603) (Muhammad Ali)",:size => 9
        end
        
        
        
        end #bounding box end
    end #def border end
    
    def infotext
        move_down 20


        # indent(5) do
        #     text "<b>Voucher #:</b>                   000000000000000000", :inline_format => true, :size => 10
        #     text "Name:                         ABCD XYZ", :size => 10
        #     text "Roll Number:               2017-10-0271/10108", :size => 10
        #     text "Academic Year:                2016 ", :size => 10
           #     text "Programme:                BS", :size => 10
        #     text "Date:                     December 2014", :size => 10
        #     text "Semester:                 Spring Semester", :size => 10
        # end
       
       float do
           indent(14) do
                table ([["LUMS NTN","0","4","5","3","6","2","7","-","4"]]) do
                        # :style(:cells,:size => 9)
                end
            end
            bounding_box [10,390], :width => 110 do
                indent(10) do
                text "<b>Voucher #:</b>", :inline_format => true, :size => 10
                text "Name:",  :size => 10
                text "Tracking ID:", :size => 10
                text "Academic Year:", :size => 10
                text "Programme:", :size => 10
                text "Date:", :size => 10
            end        
        

        end
    end
        
        bounding_box [113,390], :width => 210 do
            date = Date.today
            text "#{@voucher.voucher_no}", :inline_format => true, :size => 10
            text "#{@student.name.titleize()}", :size => 10
            text "#{@student.tracking_id}", :size => 10
            text "#{@active_session.name} ", :size => 10
            text "NOP Summer Coaching Session", :size => 10
            text "#{date.to_formatted_s(:long_ordinal)} ", :size => 10

        end
        
    end
    
    
    
    
    
    
    
    
    
    

end #class end