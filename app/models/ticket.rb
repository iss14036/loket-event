class Ticket < ApplicationRecord
  belongs_to :event
  validates :category, presence:true
  validates :price, presence:true, numericality: {only_integer: true}
  validates :quota, presence:true, numericality: {only_integer: true}
end
