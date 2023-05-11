SELECT 
    u.name AS pessoa_usuaria,
    IF(MAX(YEAR(h.date)) >= 2021,
        'Ativa',
        'Inativa') AS status_pessoa_usuaria
FROM
    users AS u
        INNER JOIN
    play_history AS h ON u.id = h.users_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;
