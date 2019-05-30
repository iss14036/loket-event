class Ticket < ApplicationRecord
  belongs_to :event
  has_many :ticket_purchases
  validates :category, presence:true
  validates :price, presence:true, numericality: {only_integer: true}
  validates :quota, presence:true, numericality: {only_integer: true}
end
