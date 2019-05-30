class TicketTransaction < ApplicationRecord
  belongs_to :customer
  has_many :ticket_purchases
  has_many :tickets, through: :ticket_purchases, source: :ticket_transaction
  validates :customer_id, presence:true
end
