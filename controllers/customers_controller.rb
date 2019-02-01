require_relative("../models/Customer")

also_reload("./models/*")

get "/customers" do
  @customers = Customer.all()
  erb( :"customers/index" )
end

get "/customers/new" do
  erb( :"customers/new")
end

post "/customers/" do
  customer = Customer.new(params)
  customer.save()
  redirect( "/customers" )
end
