class Event < ApplicationRecord

  #database relations

  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendants, through: :attendances, source: :attendant 

  belongs_to :administrator, class_name: 'User'

  #data validations
  
  validates :start_date, presence: true
  
  validates :duration,
    presence: true,
    numericality: { greater_than: 0 },
    if: Proc.new { |x| x.duration % 5 == 0 }

  validates :title,
    presence: true,
    length: { in: 5..140 }

  validates :description,
    presence: true,
    length: { in: 20..1000 }

  validates :price,
    presence: true,
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }

  validates :location, presence: true

end
