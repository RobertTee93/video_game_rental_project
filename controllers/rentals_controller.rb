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

post "/rentals/:id/delete" do
  @rental = Rental.find_by_id(params["id"])
  @rental.delete
  erb ( :"rentals/return" )
end

get "/rentals/history" do
  @rentals = Rental.history
  erb( :"rentals/history" )
end

get "/rentals/:id/new" do
  @customers = Customer.all
  @games = []
  @games << Game.find_by_id(params[:id])
  erb( :"rentals/new")
end
