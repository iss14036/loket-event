class Ticket < ApplicationRecord
  validates :category, presence:true
  validates :price, presence:true, numericality: {only_integer: true}
  validates :quota, presence:true, numericality: {only_integer: true}

  validates :event_id, presence:true
end
