DROP TABLE Categories CASCADE;
DROP TABLE Items CASCADE;

CREATE TABLE Categories (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE Items (
  id serial4 primary key,
  item_name VARCHAR(255),
  ideal_stock int4,
  current_stock int4,
  category_id int4 references Categories(id) NOT NULL
);