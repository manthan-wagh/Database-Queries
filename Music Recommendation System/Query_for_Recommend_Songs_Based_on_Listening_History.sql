SELECT
	Top 5
    s.song_name,
    s.artist,
    s.genre
FROM 
    Songs s
    JOIN User_Song_History ush ON s.song_id = ush.song_id
    JOIN Users u ON ush.user1_id = u.user1_id
WHERE 
    u.user1_id = 1
ORDER BY 
    ush.listen_count DESC
;