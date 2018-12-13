DROP TABLE adoptions;
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
  name VARCHAR(255),
  age INT2,
  type VARCHAR(255),
  ready VARCHAR(255)
);

CREATE TABLE adoptions (
  id SERIAL8 primary key,
  owner_id INT8 references owners(id),
  pet_id INT8 references pets(id)
);
