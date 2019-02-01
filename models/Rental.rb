require_relative("../db/sql_runner.rb")

class Rental

  attr_accessor :game_id, :customer_id, :date_of_rental
  attr_reader :id

  def initialize(options)
    @game_id = options["game_id"]
    @customer_id = options["customer_id"]
    @date_of_rental = options["date_of_rental"] if options["date_of_rental"]
  end

end
