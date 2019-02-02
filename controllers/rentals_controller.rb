require_relative("../models/Rental")

also_reload("../models/*")

get "/rentals" do
  @rentals = Rental.all
  erb( :"rentals/index" ) 
end
