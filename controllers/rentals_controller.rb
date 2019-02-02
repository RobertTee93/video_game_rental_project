require_relative("../models/Rental")

also_reload("../models/*")

get "/rentals" do
  @rentals = Rental.all
  erb( :"rentals/index" )
end

get "/rentals/new" do
  @games = Game.available_games
  @customers = Customer.all
  erb( :"rentals/new")
end

post "/rentals/" do
  @rental = Rental.new(params)
  @rental.save()
  erb( :"rentals/create" )
end
