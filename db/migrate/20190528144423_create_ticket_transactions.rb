class CreateTicketTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_transactions do |t|
      t.integer :customer_id

      t.timestamps
    end
  end
end
