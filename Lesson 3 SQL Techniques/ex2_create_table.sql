DROP TABLE unesco_raw;
CREATE TABLE unesco_raw(
  name TEXT,
  description TEXT,
  justification TEXT,
  year INTEGER,
  longitude FLOAT,
  latitude FLOAT,
  area_hectares FLOAT,
  category TEXT,
  category_id INTEGER,
  state TEXT,
  state_id INTEGER,
  region TEXT, 
  region_id INTEGER,
  iso TEXT,
  iso_id INTEGER);

CREATE TABLE category (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE iso(
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE state(
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE region(
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);


CREATE TABLE unesco(
  id SERIAL,
  name TEXT,
  description TEXT,
  justification TEXT,
  year INTEGER,
  longitude FLOAT,
  latitude FLOAT,
  area_hectares FLOAT,
  category_id INTEGER REFERENCES category(id) ON DELETE CASCADE,
  state_id INTEGER REFERENCES state(id) ON DELETE CASCADE,
  region_id INTEGER REFERENCES region(id) ON DELETE CASCADE,
  iso_id INTEGER REFERENCES iso(id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);