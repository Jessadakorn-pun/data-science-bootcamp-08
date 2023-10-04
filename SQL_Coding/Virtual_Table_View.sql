-- Virtual Table (View)
CREATE VIEW my_first_view as 
  SELECT 
      ar.artistid,
      ar.name as artist_name,
      al.title,
      ge.name as genre_name,
      tr.name as track_name,
      round(tr.bytes / (1024*1024.0), 2 ) as mb

  FROM 
      artists as ar, 
      albums as al,
      tracks as tr,
      genres as ge
  WHERE
      ar.artistid = al.artistid AND
      al.AlbumId = tr.albumid and
      ge.genreid = tr.genreid

-- CAN USE AS GLOBLE TABLE
SELECT *
FROM my_first_view

-- CREAT VIWE IF NOT EXISTS
CREATE VIEW IF NOT EXISTS
