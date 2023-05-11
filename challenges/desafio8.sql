SELECT 
    a.name AS artista, alb.name AS album
FROM
    artists AS a
        INNER JOIN
    album AS alb ON alb.artists_id = a.id AND a.id = 3
GROUP BY artista , album
ORDER BY album;