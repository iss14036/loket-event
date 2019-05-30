class CreateTicketPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_purchases do |t|
      t.integer :ticket_id
      t.integer :amount
      t.references :ticket_transaction, foreign_key: true
      
      t.timestamps
    end
  end
end
