DROP TABLE rentals;
DROP TABLE customers;
DROP TABLE games;

CREATE TABLE games(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  genre VARCHAR(255),
  platform VARCHAR(255),
  release_date DATE,
  box_art VARCHAR(255)
);

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  phone_number VARCHAR(255),
  date_of_birth DATE
);

CREATE TABLE rentals(
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id),
  game_id INT4 REFERENCES games(id),
  date_of_rental DATE NOT NULL DEFAULT CURRENT_DATE
)
