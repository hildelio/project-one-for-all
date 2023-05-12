SELECT 
    CASE
        WHEN u.age <= 30 THEN 'Até 30 anos'
        WHEN u.age BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
        WHEN u.age > 60 THEN 'Maior de 60 anos'
    END AS faixa_etaria,
    COUNT(DISTINCT (u.id)) AS total_pessoas_usuarias,
    COUNT(f.users_id) AS total_favoritadas
FROM
    users AS u
        LEFT JOIN
    favorite_songs AS f ON u.id = f.users_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria;