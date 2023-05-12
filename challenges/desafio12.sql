SELECT 
    a.name AS artista,
    CASE
        WHEN COUNT(f.songs_id) >= 5 THEN 'A'
        WHEN
            COUNT(f.songs_id) = 3
                OR COUNT(f.songs_id) = 4
        THEN
            'B'
        WHEN
            COUNT(f.songs_id) = 1
                OR COUNT(f.songs_id) = 2
        THEN
            'C'
        ELSE '-'
    END AS ranking
FROM
    artists AS a
        LEFT JOIN
    album AS alb ON a.id = alb.artists_id
        LEFT JOIN
    songs AS s ON s.album_id = alb.id
        LEFT JOIN
    favorite_songs AS f ON s.id = f.songs_id
GROUP BY artista
ORDER BY COUNT(f.songs_id) DESC , a.name;