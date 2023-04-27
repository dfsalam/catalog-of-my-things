CREATE TABLE Genre(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),  
  item_id INTEGER NOT NULL REFERENCES item(id)
);

CREATE TABLE MusicAlbum(  
  on_spotify VARCHAR(50),  
  item_id INTEGER NOT NULL REFERENCES item(id)
);
