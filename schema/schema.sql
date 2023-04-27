-- Create the Game table that inherits from Item
CREATE TABLE game (
  id SERIAL PRIMARY KEY,
  multiplayer VARCHAR(50),
  last_play_at DATE,
  item_id INTEGER NOT NULL REFERENCES item(id)
);

-- Create the Author table
CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);