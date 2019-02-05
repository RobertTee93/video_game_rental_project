require_relative("../db/sql_runner.rb")


class Customer

  attr_accessor :first_name, :last_name, :phone_number, :date_of_birth
  attr_reader :id

  def initialize(options)
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @phone_number = options["phone_number"]
    @date_of_birth = options["date_of_birth"]
    @id = options["id"].to_i if options["id"]
  end

  def save
    sql = "INSERT INTO customers
    (
      first_name,
      last_name,
      phone_number,
      date_of_birth
    )
      VALUES
    (
      $1, $2, $3, $4
    ) RETURNING id"
    values = [@first_name, @last_name, @phone_number, @date_of_birth]
    result = SqlRunner.run(sql, values).first
    @id = result["id"].to_i
  end

  def update
    sql = "UPDATE customers SET
    (
      first_name,
      last_name,
      phone_number,
      date_of_birth
    ) = (
      $1, $2, $3, $4
      )
      WHERE id = $5"
    values = [@first_name, @last_name, @phone_number, @date_of_birth, @id]
    SqlRunner.run(sql, values)
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  def delete
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM customers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    customer = SqlRunner.run(sql, values).first
    return Customer.new(customer)
  end

end
