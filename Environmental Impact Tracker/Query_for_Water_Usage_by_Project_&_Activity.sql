SELECT 
    p.project_name,
    a.activity_name,
    SUM(a.water_usage) AS total_water_usage
FROM 
    Projects p
    JOIN Activities a ON p.project_id = a.project_id
GROUP BY 
    p.project_name, a.activity_name;
