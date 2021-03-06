require_relative("../db/sql_runner.rb")

class Game

  attr_accessor :name, :genre, :platform, :release_date, :box_art
  attr_reader :id

  def initialize(options)
    @name = options["name"]
    @genre = options["genre"]
    @platform = options["platform"]
    @release_date = options["release_date"]
    @box_art = options["box_art"]
    @id = options["id"].to_i if options["id"]
  end

  def save
    sql = "INSERT INTO games
    (
      name,
      genre,
      platform,
      release_date,
      box_art
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @genre, @platform, @release_date, @box_art]
    results = SqlRunner.run(sql, values).first
    @id = results["id"].to_i
  end

  def delete
    sql = "DELETE FROM games WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM games WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM games ORDER BY name"
    games = SqlRunner.run(sql)
    return games.map { |game| Game.new(game) }
  end

  def self.all_by_date
    sql = "SELECT * FROM games ORDER BY release_date"
    games = SqlRunner.run(sql)
    return games.map { |game| Game.new(game) }
  end

  def self.available_games
    sql = "SELECT games.* FROM games LEFT JOIN rentals
           ON games.id = rentals.game_id
           WHERE rentals.game_id IS NULL"
    available_games = SqlRunner.run(sql)
    return available_games.map { |game| Game.new(game) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM games WHERE id = $1"
    values = [id]
    game = SqlRunner.run(sql, values).first
    return Game.new(game)
  end

  def self.genres()
    sql = "SELECT DISTINCT genre FROM games;"
    genres = SqlRunner.run(sql)
    return genres.map { |genre| genre["genre"] }
  end

  def self.platforms()
    sql = "SELECT DISTINCT platform FROM games;"
    platforms = SqlRunner.run(sql)
    return platforms.map { |platform| platform["platform"] }
  end

  def self.find_by_genre(genre)
    sql = "SELECT * FROM games WHERE genre = $1"
    values = [genre]
    games = SqlRunner.run(sql, values)
    return games.map { |game| Game.new(game)}
  end

  def self.find_by_platform(platform)
    sql = "SELECT * FROM games WHERE platform = $1"
    values = [platform]
    games = SqlRunner.run(sql, values)
    return games.map { |game| Game.new(game)}
  end

  def self.search_by_word(word)
    games = self.all
    found_games = []
    games.each do |game| if game.name.downcase.include?(word.downcase)
      found_games << game end
    end
    return found_games
  end

end
