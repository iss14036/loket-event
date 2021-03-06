class Event < ApplicationRecord
  belongs_to :location
  has_many :tickets
  validates :description, presence:true
  validates :origanizer, presence:true
  validates :start_date, presence:true
  validates :end_date, presence:true
end
