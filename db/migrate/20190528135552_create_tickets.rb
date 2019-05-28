class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :category
      t.integer :price
      t.integer :quota
      t.integer :event_id

      t.timestamps
    end
  end
end
