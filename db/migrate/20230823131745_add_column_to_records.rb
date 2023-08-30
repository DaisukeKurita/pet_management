class AddColumnToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :user_id, :integer
    add_column :records, :pet_id, :integer
  end
end
