-- Create Book table

CREATE TABLE BOOK (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    item_id INTEGER NOT NULL REFERENCES itme(id)
)

-- Create Lable table

CREATE TABLE LABEL (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255),
)