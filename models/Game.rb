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


end
