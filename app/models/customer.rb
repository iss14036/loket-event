class Customer < ApplicationRecord
  validates :name, presence:true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence:true
end
