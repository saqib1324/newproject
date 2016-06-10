# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
UndertakingText.create!(:session => '2016', :display_text => "standard display text")
Letter.create!(:boarder_letter_text => 'standard boarder letter display text', :day_scholar_letter_text => "standard boarder display text")
User.create!(:email => 'nop@lums.edu.pk', :password => 'windows787!', :role => "admin")
CoachingSession.create!(:name => '2016',:status => true)
CoachingSession.create!(:name => '2017',:status => false)
CoachingSession.create!(:name => '2018',:status => false)
# Student.create!(:session => "2016", :name => "Muhammad Sohail Aslam", :tracking_id => "2016-N-0012",:boarder => true, :matric_percentage => "95.86", :monthly_income => "50000", :SEX => "M", :section => "A", :city => "Lahore", :father_name => "Aslam", :DOB => "26/08/1994",  :email => "sohail@gmail.com", :phone_number => "0300-2241243214", :secondary_phone_number => "042-1234213454", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std1@lums.edu.pk", :password => "123456")
# Student.create!(:session => "2016",:name => "Aliya Ali", :tracking_id => "2016-N-0783",:boarder => true, :matric_percentage => "94.6", :monthly_income => "48000", :SEX => "F", :section => "B", :city => "Islamabad", :father_name => "Ali Hussain", :DOB => "21/04/1999",  :email => "aliya@gmail.com", :phone_number => "0300-23523452346", :secondary_phone_number => "042-324324322", :mailing_address => "Gulzar colony, Peshawar cantt", :username => "std2@lums.edu.pk", :password => "123456")
# Student.create!(:session => "2016",:name => "Hafiz Muhammad junaid Raza", :tracking_id => "2016-N-0955",:boarder => true, :matric_percentage => "93.86", :monthly_income => "44000", :SEX => "M", :section => "C", :city => "Lahore", :father_name => "Raza Ahmed Khan", :DOB => "13/08/1996",  :email => "junaid@lol.com", :phone_number => "0300-234536235", :secondary_phone_number => "042-235235", :mailing_address => "H. No. E-855/C, Gulzar House Lahore cantt", :username => "std3@lums.edu.pk", :password => "123456")
# Student.create!(:session => "2016",:name => "Muhammad Saud Bukhari", :tracking_id => "2016-N-0234",:boarder => true, :matric_percentage => "92.846", :monthly_income => "42000", :SEX => "M", :section => "D", :city => "Karachi", :father_name => "Junaid Bukhari", :DOB => "23/08/1994",  :email => "bukhari@gmail.com", :phone_number => "0300-23525", :secondary_phone_number => "042-37153453", :mailing_address => "Layari central Colony Karachi cantt", :username => "std4@lums.edu.pk", :password => "123456")
# Student.create!(:session => "2016",:name => "Sadia Pervez", :tracking_id => "2016-N-0567",:boarder => true, :matric_percentage => "89.86", :monthly_income => "38000", :SEX => "F", :section => "E", :city => "Gujranwala", :father_name => "Allah dita", :DOB => "16/08/1998",  :email => "sadia@gmail.com", :phone_number => "0300-234523656", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. 12/A gujrawnwala cantt", :username => "std5@lums.edu.pk", :password => "123456")
# Student.create!(:session => "2016",:name => "Muhammad Asghar", :tracking_id => "2016-N-0612",:boarder => true, :matric_percentage => "95.816", :monthly_income => "40000", :SEX => "M", :section => "D", :city => "Lahore", :father_name => "Haq Ilahi", :DOB => "06/08/1999",  :email => "asghar@gmail.com", :phone_number => "0300-2345656354", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std6@lums.edu.pk", :password => "123456")
# Student.create!(:session => "2016",:name => "Aimen Abdullah khan", :tracking_id => "2016-N-4012",:boarder => true, :matric_percentage => "91.816", :monthly_income => "38000", :SEX => "F", :section => "D", :city => "Islamabad", :father_name => "Abdullah Khan", :DOB => "14/03/2000",  :email => "aimen@hotmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std6@lums.edu.pk", :password => "123456")
# Student.create!(:session => "2016",:name => "Hashim Haider", :tracking_id => "2016-N-5012",:boarder => true, :matric_percentage => "91.486", :monthly_income => "36000", :SEX => "M", :section => "C", :city => "Sanghar", :father_name => "Haider ahmed", :DOB => "26/08/1996",  :email => "haider@gmail.com", :phone_number => "0300-125235222", :secondary_phone_number => "042-2346264", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std7@lums.edu.pk", :password => "123456")
# Student.create!(:session => "2016",:name => "Junaid Haroon Siddiqui", :tracking_id => "2016-N-3452",:boarder => true, :matric_percentage => "90.86", :monthly_income => "34000", :SEX => "M", :section => "A", :city => "Mianwali", :father_name => "Haroon Askari", :DOB => "24/02/1999",  :email => "junaid@lums.com", :phone_number => "0300-1224545", :secondary_phone_number => "042-2345656", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std8@lums.edu.pk", :password => "123456")
# Student.create!(:session => "2016",:name => "Shazia Saleem rana", :tracking_id => "2016-N-7012",:boarder => true, :matric_percentage => "85.346", :monthly_income => "67000", :SEX => "F", :section => "B", :city => "Lahore", :father_name => "Muqsit saleem", :DOB => "26/08/1994",  :email => "ranag@gmail.com", :phone_number => "0300-12534537", :secondary_phone_number => "042-652345", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std9@lums.edu.pk", :password => "123456")
# Student.create!(:session => "2016",:name => "Muhammad Affan Ahmed", :tracking_id => "2016-N-4512",:boarder => true, :matric_percentage => "88.86", :monthly_income => "28000", :SEX => "M", :section => "B", :city => "Sakhar", :father_name => "Askari khan", :DOB => "26/08/1994",  :email => "sohail@gmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-2345265", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std10@lums.edu.pk", :password => "123456")
# Student.create!(:session => "2016",:name => "Hadiqa khan", :tracking_id => "2016-N-5013",:boarder => true, :matric_percentage => "95.186", :monthly_income => "40000", :SEX => "F", :section => "A", :city => "Bahawalpur", :father_name => "Khan haq", :DOB => "26/08/1994",  :email => "sohail@gmail.com", :phone_number => "0300-254453623", :secondary_phone_number => "042-24566", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std11@lums.edu.pk", :password => "123456")
# User.create!(:email => 'std1@lums.edu.pk', :password => '123456', :role => "student")
# User.create!(:email => 'std2@lums.edu.pk', :password => '123456', :role => "student")
# User.create!(:email => 'std3@lums.edu.pk', :password => '123456', :role => "student")
# User.create!(:email => 'std4@lums.edu.pk', :password => '123456', :role => "student")
# User.create!(:email => 'std5@lums.edu.pk', :password => '123456', :role => "student")
# User.create!(:email => 'std6@lums.edu.pk', :password => '123456', :role => "student")
# User.create!(:email => 'std7@lums.edu.pk', :password => '123456', :role => "student")
# User.create!(:email => 'std9@lums.edu.pk', :password => '123456', :role => "student")
# User.create!(:email => 'std10@lums.edu.pk', :password => '123456', :role => "student")
# User.create!(:email => 'std11@lums.edu.pk', :password => '123456', :role => "student")
# User.create!(:email => 'std8@lums.edu.pk', :password => '123456', :role => "student")
