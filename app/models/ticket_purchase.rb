class TicketPurchase < ApplicationRecord
  belongs_to :ticket_transaction
  belongs_to :ticket
  validates :amount, presence:true
end
