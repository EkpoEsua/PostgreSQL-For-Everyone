--- load data into the track table from csv files

--- \copy track(title,artist,album,count,rating,len) FROM 'library.csv' WITH DELIMITER ',' CSV;

--- populate album table and update album_id column in track table

INSERT INTO album(title) SELECT DISTINCT album FROM track;

UPDATE track SET album_id = album.id FROM album WHERE album.title = track.album;

--- do same for the artist and tracktoartist table

INSERT INTO artist(name) SELECT DISTINCT artist FROM track;

INSERT INTO tracktoartist(artist, track) SELECT DISTINCT artist, title FROM track;

UPDATE tracktoartist SET artist_id = artist.id FROM artist WHERE artist.name = tracktoartist.artist;

UPDATE tracktoartist SET track_id = track.id FROM track WHERE track.title = tracktoartist.track;

--- get rid of unwanted columns in the track and tracktoartist tables

ALTER TABLE track DROP COLUMN artist;

ALTER TABLE track DROP COLUMN album;

ALTER TABLE tracktoartist DROP COLUMN artist;

ALTER TABLE tracktoartist DROP COLUMN track;

--- Test query

SELECT track.title, album.title, artist.name
FROM track
JOIN album ON track.album_id = album.id
JOIN tracktoartist ON track.id = tracktoartist.track_id
JOIN artist ON tracktoartist.artist_id = artist.id
ORDER BY track.title
LIMIT 3;
