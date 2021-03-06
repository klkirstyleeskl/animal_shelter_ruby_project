
DROP TABLE pets;
DROP TABLE owners;

CREATE TABLE owners (
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  telephone_number INT8
);

CREATE TABLE pets (
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  age INT2 not null,
  type VARCHAR(255) not null,
  ready VARCHAR(255) not null,
  owner_id INT8 references owners(id),
  image TEXT
);
