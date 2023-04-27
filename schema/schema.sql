
-- Create Lable table

CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255),
)

-- Create Genre table
CREATE TABLE genre(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),  
);

-- Create Author table
CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
);


-- Create Item table

CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    archived BOOLEAN NOT NULL,
    publish_date DATE NOT NULL,
    genre_id INT,
    author_id INT,
    label_id INT,

    FOREIGN KEY (label_id) REFERENCES label(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE ON UPDATE CASCADE
)

-- Create Book table

CREATE TABLE book (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    item_id INTEGER NOT NULL REFERENCES item(id)
)

--  Create Music Album table
CREATE TABLE music_album(  
  on_spotify VARCHAR(50),  
  item_id INTEGER NOT NULL REFERENCES item(id)
);

-- Create Game table
CREATE TABLE game (
  id SERIAL PRIMARY KEY,
  multiplayer VARCHAR(50),
  last_play_at DATE,
  item_id INTEGER NOT NULL REFERENCES item(id)
);



