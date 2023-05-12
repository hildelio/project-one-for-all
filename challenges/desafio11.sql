SELECT 
    a.name AS album, COUNT(f.songs_id) AS favoritadas
FROM
    favorite_songs AS f
        INNER JOIN
    songs AS s ON s.id = f.songs_id
        INNER JOIN
    album AS a ON a.id = s.album_id
GROUP BY album
ORDER BY favoritadas DESC
LIMIT 3;