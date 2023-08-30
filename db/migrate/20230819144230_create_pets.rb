class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :user_id
      t.integer :animal_id

      t.timestamps
    end
  end
end
