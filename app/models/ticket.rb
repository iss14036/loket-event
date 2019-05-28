class Ticket < ApplicationRecord
  validates :category, presence:true
  validates :price, presence:true
  validates :quota, presence:true
  validates :event_id, presence:true
end
