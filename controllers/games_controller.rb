require_relative("../models/Game")

also_reload("../models/*")

get "/games" do
  @genres = Game.genres
  @games = Game.all
  erb( :"games/index" )
end

get "/games/find/:genre" do
  @games = Game.find_by_genre(params[:genre])
  erb( :"games/genre")
end

get "/games/search/" do
  @games = Game.search_by_word(params[:word])
  erb( :"games/search")
end

get "/games/new" do
  erb( :"games/new")
end

post "/games/" do
  game = Game.new(params)
  game.save
  redirect( "/games" )
end

post "/games/:id/delete" do
  @game = Game.find_by_id(params["id"])
  @game.delete()
  erb( :"games/delete" )
end

get "/games/available" do
  @games = Game.available_games
  erb( :"games/available")
end
