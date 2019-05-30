class Transaction < ApplicationRecord
  validates :customer_id, presence:true
end
