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

  def archive
    sql = "INSERT INTO rental_history
    (
      rental_id,
      game_name,
      customer_name,
      date_of_rental
    )
      VALUES
    (
      $1, $2, $3, $4
    )"
    values = [@id, game().name, customer().full_name, @date_of_rental]
    SqlRunner.run(sql, values)
  end

  def self.history
    sql = "SELECT * FROM rental_history"
    rentals = SqlRunner.run(sql)
    return rentals
  end

  def delete
    archive()
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

  def customer()
    sql = "SELECT customers.* FROM customers INNER JOIN rentals
           ON customers.id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values).first
    return Customer.new(customer)
  end

  def game()
    sql = "SELECT games.* FROM games INNER JOIN rentals
           ON games.id = $1"
    values = [@game_id]
    game = SqlRunner.run(sql, values).first
    return Game.new(game)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM rentals WHERE id = $1"
    values = [id]
    rental = SqlRunner.run(sql, values).first
    return Rental.new(rental)
  end



end
