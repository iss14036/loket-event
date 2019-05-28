class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.string :origanizer
      t.string :start_date
      t.string :end_date
      t.integer :location_id

      t.timestamps
    end
  end
end
