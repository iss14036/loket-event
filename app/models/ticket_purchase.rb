class TicketPurchase < ApplicationRecord
  validates :ticket_id, presence:true
  validates :amount, presence:true
  validates :transaction_id, presence:true
end
