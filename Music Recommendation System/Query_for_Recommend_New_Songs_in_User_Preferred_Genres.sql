SELECT TOP 5
    s.song_name,
    s.artist,
    s.genre
FROM 
    Songs s
    JOIN User_Preferences up ON s.genre = up.genre
WHERE 
    up.user1_id = 1
    AND s.release_date > DATEADD(MONTH, -1, GETDATE())
ORDER BY 
    s.release_date DESC;