animal_kinds = ["犬", "猫", "ハムスター", "カワウソ", "フェレット",
  "フクロウ", "ハリネズミ", "ウサキ", "インコ", "金魚",
  "熱帯魚", "メダカ", "その他魚"]
animal_kinds.each do |kind|
  Animal.create(kind: kind)
end

User.create(name: "sample", email: "name@sample.com", password: "11111")

pets = [
  {name: "こむぎ", animal_id: 2},
  {name: "ぽぽ", animal_id: 2},
  {name: "テディ", animal_id: 1}
]
n = 0
pets.each do |pet|
  Pet.create(
    name: pets[n][:name],
    user_id: 1,
    animal_id: pets[n][:animal_id]
  )
  n += 1
end

records = [
  {date_and_time: DateTime.new(2023,8,26,18, 0, 0),
  amount_of_food: 100,
  amount_of_water: 80,
  note: "元気だった。",
  pet_id: 1,
  user_id: 1
  },
  {date_and_time: DateTime.new(2023,8,27,18, 0, 0),
    amount_of_food: 120,
    amount_of_water: 90,
    note: "食べ過ぎかな。",
    pet_id: 1,
    user_id: 1
    },
  {date_and_time: DateTime.new(2023,8,26,18, 30, 0),
    amount_of_food: 110,
    amount_of_water: 85,
    note: "よく寝てた。",
    pet_id: 2,
    user_id: 1
    }
]
n = 0
pets.each do |pet|
  Record.create(
    date_and_time: records[n][:date_and_time],
    amount_of_food: records[n][:amount_of_food],
    amount_of_water: records[n][:amount_of_water],
    note: records[n][:note],
    pet_id: records[n][:pet_id],
    user_id: 1
  )
  n += 1
end


