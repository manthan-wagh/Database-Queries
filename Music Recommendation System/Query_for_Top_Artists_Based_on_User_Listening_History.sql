SELECT
	TOP 3
    s.artist,
    SUM(ush.listen_count) AS total_listens
FROM 
    Songs s
    JOIN User_Song_History ush ON s.song_id = ush.song_id
GROUP BY 
    s.artist
ORDER BY 
    total_listens DESC
;