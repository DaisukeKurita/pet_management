class Pet < ApplicationRecord
  validates :name, {presence: true}

  def records
    return Record.where(pet_id: self.id).order(date_and_time: "DESC")
  end
end
