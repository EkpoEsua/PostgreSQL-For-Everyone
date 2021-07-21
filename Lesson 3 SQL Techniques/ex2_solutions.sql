--- load date from .csv file into the unesco_raw table

--- \copy unesco_raw(name,description,justification,year,longitude,latitude,area_hectares,category,state,region,iso) FROM 'whc-sites-2018-small.csv' WITH DELIMITER ',' CSV HEADER;


--- populate the category table with unique information from the category column the unesco_raw table

INSERT INTO category(name) SELECT DISTINCT category FROM unesco_raw;

--- do same for the iso, region, and state tables

INSERT INTO iso(name) SELECT DISTINCT iso FROM unesco_raw;

INSERT INTO region(name) SELECT DISTINCT region FROM unesco_raw;

INSERT INTO state(name) SELECT DISTINCT state FROM unesco_raw;


--- fill in the catgory_id column in the unesco_raw table with the corresponding primary 
--- key from the category table, for the name column in the category table, matching
--- the category column in the unsesco_raw table

UPDATE unesco_raw SET category_id = category.id FROM category WHERE category.name = unesco_raw.category;


---- do same for the iso_id, region_id and state_id in the unsesco_raw table

UPDATE unesco_raw SET iso_id = iso.id FROM iso WHERE iso.name = unesco_raw.iso;

UPDATE unesco_raw SET region_id = region.id FROM region WHERE region.name = unesco_raw.region;

UPDATE unesco_raw SET state_id = state.id FROM state WHERE state.name = unesco_raw.state;


--- copy the required columns from the unesco_raw table into the unesco table

INSERT INTO unesco( name, description, justification,
                    year, longitude, latitude,
                    area_hectares, category_id, state_id,
                    region_id, iso_id)
            (SELECT  name, description, justification,
                    year, longitude, latitude,
                    area_hectares, category_id, state_id,
                    region_id, iso_id
            FROM unesco_raw);




--- query to test data

SELECT unesco.name, year, category.name, state.name, region.name, iso.name
  FROM unesco
  JOIN category ON unesco.category_id = category.id
  JOIN iso ON unesco.iso_id = iso.id
  JOIN state ON unesco.state_id = state.id
  JOIN region ON unesco.region_id = region.id
  ORDER BY iso.name, unesco.name
  LIMIT 3;
