require_relative("../models/Game")

also_reload("../models/*")

get "/games" do
  @games = Game.all
  erb( :"games/index" )
end

post "/games/:id/delete" do
  @game = Game.find_by_id(params["id"])
  @game.delete()
  erb( :"games/delete" )
end
