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

game3 = Game.new({
  "name" => "Super Smash Brothers Ultimate",
  "genre" => "Fighting",
  "platform" => "Nintendo Switch",
  "release_date" => "2018-12-07",
  "box_art" => "https://images-na.ssl-images-amazon.com/images/I/81hxAPWEziL._SY445_.jpg"
  })

game4 = Game.new({
  "name" => "Forza Motorsport 7",
  "genre" => "Racing",
  "platform" => "Xbox One",
  "release_date" => "2018-10-03",
  "box_art" => "https://images-na.ssl-images-amazon.com/images/I/81EO2OPzoML._SX342_.jpg"
  })

game5 = Game.new({
  "name" => "Mario Kart 8 Deluxe",
  "genre" => "Racing",
  "platform" => "Nintendo Switch",
  "release_date" => "2018-04-28",
  "box_art" => "https://images-na.ssl-images-amazon.com/images/I/91BphPXVYVL._SY445_.jpg"
  })

game6 = Game.new({
  "name" => "The Legend of Zelda: Breath of the Wild",
  "genre" => "Adventure",
  "platform" => "Nintendo Switch",
  "release_date" => "2017-03-03",
  "box_art" => "https://images-na.ssl-images-amazon.com/images/I/81VNAXO6PmL._SY445_.jpg"
  })

game7 = Game.new({
  "name" => "Resident Evil 2",
  "genre" => "Survival/Horror",
  "platform" => "PS4",
  "release_date" => "2019-01-25",
  "box_art" => "https://images-na.ssl-images-amazon.com/images/I/915dUNOufyL._AC_SX430_.jpg"
  })

game8 = Game.new({
  "name" => "Kingdom Hearts 3",
  "genre" => "RPG",
  "platform" => "Xbox One",
  "release_date" => "2019-01-25",
  "box_art" => "https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6255/6255212_sd.jpg;maxHeight=640;maxWidth=550"
  })

game9 = Game.new({
  "name" => "Minecraft",
  "genre" => "Sandbox",
  "platform" => "Xbox One",
  "release_date" => "2009-05-17",
  "box_art" => "https://www.virginmegastore.ae/medias/sys_master/root/h81/hc4/9109707259934/Minecraft-Xbox-One-Edition-401404-Detail.jpg"
  })

game10 = Game.new({
  "name" => "Fifa 19",
  "genre" => "Sport",
  "platform" => "PS4",
  "release_date" => "2018-09-28",
  "box_art" => "https://icdn3.digitaltrends.com/image/fifa-19-game-art-ps4-720x720.jpg"
  })

game11 = Game.new({
  "name" => "Crash Bandicoot N. Sane Trilogy",
  "genre" => "Platformer",
  "platform" => "PS4",
  "release_date" => "2017-06-30",
  "box_art" => "https://images-na.ssl-images-amazon.com/images/I/91iP4NOH5yL._SX342_.jpg"
  })

game12 = Game.new({
  "name" => "Spyro Reignited Trilogy",
  "genre" => "Platformer",
  "platform" => "Xbox One",
  "release_date" => "2018-11-13",
  "box_art" => "https://images-na.ssl-images-amazon.com/images/I/81jZEz72nPL._SY445_.jpg"
  })

game1.save
game2.save
game3.save
game4.save
game5.save
game6.save
game7.save
game8.save
game9.save
game10.save
game11.save
game12.save

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

customer3 = Customer.new({
  "first_name" => "Scott",
  "last_name" => "Townley",
  "phone_number" => "07937465376",
  "date_of_birth" => "1994-01-05"
  })

customer4 = Customer.new({
  "first_name" => "David",
  "last_name" => "Whyte",
  "phone_number" => "07734211287",
  "date_of_birth" => "2000-04-17"
  })

customer5 = Customer.new({
  "first_name" => "Kian",
  "last_name" => "Carnochan",
  "phone_number" => "07987342212",
  "date_of_birth" => "2000-04-24"
  })

customer1.save
customer2.save
customer3.save
customer4.save
customer5.save

rental1 = Rental.new({
  "game_id" => game1.id,
   "customer_id" => customer2.id
  })

rental2 = Rental.new({
  "game_id" => game6.id,
   "customer_id" => customer4.id
  })

rental3 = Rental.new({
  "game_id" => game4.id,
   "customer_id" => customer3.id
  })

rental1.save
rental2.save
rental3.save








binding.pry
nil
