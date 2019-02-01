require_relative("../models/Customer")

also_reload("./models/*")

get "/customers" do
  @customers = Customer.all()
  erb( :"customers/index" )
end
