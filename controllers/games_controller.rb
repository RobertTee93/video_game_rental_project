require_relative("../models/Game")

also_reload("../models/*")

get "/games" do
  @games = Game.all
  erb( :"games/index" )
end
