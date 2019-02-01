require_relative("../models/Customer")
require_relative("../models/Game")
require_relative("../models/Rental")
require("pry")

game1 = Game.new({
  "name" => "Final Fantasy XV",
  "genre" => "RPG",
  "platform" => "PS4",
  "release_date" => "2016-11-29",
  "box_art" => "/images/final-fantasy-xv-ps4.jpg"
  })

game2 = Game.new({
  "name" => "Call of Duty Black Ops 4",
  "genre" => "FPS",
  "platform" => "PS4",
  "release_date" => "2018-10-12",
  "box_art" => "/images/black_ops_4.jpg"
  })

game1.save
game2.save

customer1 = Customer.new({
  "first_name" => "Thomas",
  "last_name" => "Whyte",
  "phone_number" => "07745281933",
  "date_of_birth" => "1999-06-27"
  })

customer2 = Customer.new({
  "first_name" => "Martin",
  "last_name" => "Kane",
  "phone_number" => "07736442357",
  "date_of_birth" => "1993-06-30"
  })

customer1.save
customer2.save

rental1 = Rental.new({
  "game_id" => game1.id,
   "customer_id" => customer2.id
  })

rental1.save








binding.pry
nil
