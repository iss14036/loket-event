class Customer < ApplicationRecord
  has_many :ticket_transactions
  validates :name, presence:true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence:true
end
