class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.text :tickets, array: true, default: []

      t.timestamps
    end
  end
end
