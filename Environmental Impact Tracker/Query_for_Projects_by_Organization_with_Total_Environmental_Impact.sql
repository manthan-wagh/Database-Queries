SELECT 
    o.organization_name,
    p.project_name,
    SUM(a.carbon_emissions) AS total_carbon_emissions,
    SUM(a.water_usage) AS total_water_usage,
    SUM(a.energy_consumption) AS total_energy_consumption
FROM 
    Organizations o
    JOIN Projects p ON o.organization_id = p.organization_id
    JOIN Activities a ON p.project_id = a.project_id
GROUP BY 
    o.organization_name, p.project_name;
