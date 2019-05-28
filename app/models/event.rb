class Event < ApplicationRecord
  validates :description, presence:true
  validates :origanizer, presence:true
  validates :start_date, presence:true
  validates :end_date, presence:true
  validates :location_id, presence:true
end
