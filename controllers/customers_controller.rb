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

get "/customers/:id/edit" do
  @customer = Customer.find_by_id(params[:id])
  erb( :"customers/edit")
end

post "/customers/:id" do
  customer = Customer.new(params)
  customer.update()
  redirect( "/customers")
end

post "/customers/:id/delete" do
  @customer = Customer.find_by_id(params["id"])
  @customer.delete()
  erb( :"customers/delete")
end
