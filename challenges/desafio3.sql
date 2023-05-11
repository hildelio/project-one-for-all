SELECT 
    u.name AS pessoa_usuaria,
    COUNT(h.songs_id) AS musicas_ouvidas,
    ROUND(SUM(s.duration) / 60, 2) AS total_minutos
FROM
    users AS u
        INNER JOIN
    play_history AS h ON u.id = h.users_id
        INNER JOIN
    songs AS s ON s.id = h.songs_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;


