class Attendance < ApplicationRecord
 
  belongs_to :attendant, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
  
end
