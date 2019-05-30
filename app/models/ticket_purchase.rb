class TicketPurchase < ApplicationRecord
  belongs_to :ticket_transaction
  validates :ticket_id, presence:true
  validates :amount, presence:true
end
