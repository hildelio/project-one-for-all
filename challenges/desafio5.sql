SELECT 
    s.track AS cancao, COUNT(h.songs_id) AS reproducoes
FROM
    songs AS s
        INNER JOIN
    play_history AS h ON s.id = h.songs_id
GROUP BY cancao
ORDER BY reproducoes DESC , cancao
LIMIT 2;
