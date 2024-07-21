SELECT 
    t.team_name,
    SUM(s.points_scored) AS total_points
FROM
    Teams t
    JOIN Players p ON t.team_id = p.team_id
    JOIN Scores s ON p.player_id = s.player_id
WHERE
    s.match_id = 1
GROUP BY
    t.team_name;