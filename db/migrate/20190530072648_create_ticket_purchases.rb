class CreateTicketPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_purchases do |t|
      t.integer :ticket_id
      t.integer :amount
      t.integer :transaction_id
      
      t.timestamps
    end
  end
end
