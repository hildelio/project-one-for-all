SELECT 
    COUNT(*) AS musicas_no_historico
FROM
    play_history
WHERE
    users_id = 1;