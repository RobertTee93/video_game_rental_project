require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../Game")

class GameTest < Minitest::Test

  def setup
    @game1 = Game.new({
      "name" => "Final Fantasy XV",
      "genre" => "RPG",
      "platform" => "PS4",
      "release_date" => "2016-11-29",
      "box_art" => "/images/final-fantasy-xv-ps4.jpg"
      })

    @game2 = Game.new({
      "name" => "Call of Duty Black Ops 4",
      "genre" => "FPS",
      "platform" => "PS4",
      "release_date" => "2018-10-12",
      "box_art" => "/images/black_ops_4.jpg"
      })
  end

  def test_can_search_by_name
    result = Game.search_by_word("final")
    assert_equal(@game1.name, result[0].name)
  end




end
