SELECT 
    a.activity_name,
    a.activity_date,
    a.carbon_emissions
FROM 
    Activities a
WHERE 
    a.carbon_emissions > 100
ORDER BY 
    a.activity_date DESC;
