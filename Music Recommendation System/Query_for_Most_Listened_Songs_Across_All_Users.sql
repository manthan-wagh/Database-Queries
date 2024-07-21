SELECT 
	TOP 5
    s.song_name,
    s.artist,
    s.genre,
    SUM(ush.listen_count) AS total_listens
FROM 
    Songs s
    JOIN User_Song_History ush ON s.song_id = ush.song_id
GROUP BY 
    s.song_name,
    s.artist,
    s.genre
ORDER BY 
    total_listens DESC
;