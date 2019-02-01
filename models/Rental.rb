require_relative("../db/sql_runner.rb")

class Rental

  attr_accessor :game_id, :customer_id, :date_of_rental
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @game_id = options["game_id"]
    @customer_id = options["customer_id"]
    @date_of_rental = options["date_of_rental"] if options["date_of_rental"]
  end

  def save
    sql = "INSERT INTO rentals
    (
      game_id,
      customer_id
    )
      VALUES
    (
      $1, $2
    ) RETURNING id, date_of_rental"
    values = [@game_id, @customer_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"]
    @date_of_rental = result[0]["date_of_rental"]
  end

  def delete
    sql = "DELETE FROM rentals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM rentals WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM rentals"
    rentals = SqlRunner.run(sql)
    return rentals.map { |rental| Rental.new(rental) }
  end


end
