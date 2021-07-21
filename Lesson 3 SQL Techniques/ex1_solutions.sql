--- Auto-normalization of data

--- First Load raw .csv file into the raw database

--- \copy track_raw(title, artist, album, count, rating, len) FROM 'library.csv' WITH DELIMITER ',' CSV;

--- select unique values from the album column of the track_raw table and load it into the 
--- album table, to create a primary key for each

insert into album(title) select distinct album from track_raw;


--- update the album_id column of track_raw table using the id of the album track, matching
--- the columns where the album column on the track_raw table is the same as the
--- title column on the album table
update track_raw set album_id = album.id from album where album.title = track_raw.album;


--- populate the track table with just the required columns from the track_raw table
insert into track(title, len, rating, count, album_id) 
    (SELECT title, len, rating, count, album_id FROM track_raw);
