# video_game_rental_project
Video Game Rental web app using Ruby, Sinatra and PostgreSQL which allows games and customers to be added and games to be rented to customers.

requirements to run app, PostgreSQL and Sinatra

To run the app:

- Go to Terminal and Navigate to the db folder
- type psql -d video_game_rental -f rental_store.sql and this will populate the database with empty tables
- type ruby seeds.rb and this will populate the database tables with some data
- navigate back to video_game_rental folder
- Type ruby app.rb in the terminal window
- App should then open in default browser...
- If app does not automatically open web address http://localhost:4567/
