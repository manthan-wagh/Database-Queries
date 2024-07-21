SELECT 
    p.project_name,
    SUM(a.carbon_emissions) AS total_carbon_emissions
FROM 
    Projects p
    JOIN Activities a ON p.project_id = a.project_id
GROUP BY 
    p.project_name;
