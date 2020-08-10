class User < ApplicationRecord
  
  #database relations
  
  has_many :administrated_events, foreign_key: 'administrator_id', class_name:"Event" 
  
  has_many :attendances, foreign_key: :attendant_id
  has_many :attended_events, through: :attendances, source: :attended_event

end
