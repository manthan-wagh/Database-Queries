SELECT 
    t.team_name,
    SUM(s.points_scored) AS total_points
FROM
    Teams t
    JOIN Players p ON t.team_id = p.team_id
    JOIN Scores s ON p.player_id = s.player_id
    JOIN Matches m ON s.match_id = m.match_id
    JOIN Team_League tl ON t.team_id = tl.team_id
    JOIN League l ON tl.league_id = l.league_id
WHERE
    l.season = '2023'
GROUP BY
    t.team_name
ORDER BY
    total_points DESC;