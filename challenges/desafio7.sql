SELECT 
    a.name AS artista,
    alb.name AS album,
    COUNT(a.name) AS pessoas_seguidoras
FROM
    artists AS a
        INNER JOIN
    album AS alb ON alb.artists_id = a.id
        INNER JOIN
    following AS f ON f.artists_id = a.id
GROUP BY artista , album
ORDER BY pessoas_seguidoras DESC , artista , album
