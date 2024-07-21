SELECT
	TOP 5
    s.song_name,
    s.artist,
    s.genre
FROM 
    Songs s
    JOIN User_Preferences up ON s.genre = up.genre
WHERE 
    up.user1_id = 1
ORDER BY 
    up.preference_score DESC,
    s.release_date DESC
;