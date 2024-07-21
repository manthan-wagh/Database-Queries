SELECT 
    p.player_name,
    SUM(s.points_scored) AS total_points,
    RANK() OVER (ORDER BY SUM(s.points_scored) DESC) AS ranking
FROM
    Players p
    JOIN Scores s ON p.player_id = s.player_id
    JOIN Matches m ON s.match_id = m.match_id
    JOIN Team_League tl ON p.team_id = tl.team_id
    JOIN League l ON tl.league_id = l.league_id
WHERE
    l.season = '2023'
GROUP BY
    p.player_name;

