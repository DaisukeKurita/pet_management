class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.datetime :date_and_time
      t.integer :amount_of_food
      t.integer :amount_of_water
      t.text :note

      t.timestamps
    end
  end
end
