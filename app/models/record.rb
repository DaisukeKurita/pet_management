class Record < ApplicationRecord
  validates :date_and_time, {presence: true}
  validates :amount_of_food, {presence: true}

  def pet_name_check
    if Pet.exists?(id: self.pet_id)
      return Pet.find(self.pet_id).name
    else
      return "未登録"
    end
  end
end
