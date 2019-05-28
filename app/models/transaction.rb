class Transaction < ApplicationRecord
  validates :customer_id, presence:true
  validates :tickets, presence:true
end
