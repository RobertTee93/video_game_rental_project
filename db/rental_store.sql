DROP TABLE rental_history;
DROP TABLE rentals;
DROP TABLE customers;
DROP TABLE games;

CREATE TABLE games(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  genre VARCHAR(255) NOT NULL,
  platform VARCHAR(255) NOT NULL,
  release_date DATE NOT NULL,
  box_art VARCHAR(255) NOT NULL
);

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NOT NULL,
  date_of_birth DATE
);

CREATE TABLE rentals(
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  game_id INT4 REFERENCES games(id) ON DELETE CASCADE,
  date_of_rental DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE rental_history(
  id SERIAL4 PRIMARY KEY,
  rental_id INT4,
  game_name VARCHAR(255),
  customer_name VARCHAR(255),
  date_of_rental DATE NOT NULL DEFAULT CURRENT_DATE,
  returned_date DATE NOT NULL DEFAULT CURRENT_DATE

);
