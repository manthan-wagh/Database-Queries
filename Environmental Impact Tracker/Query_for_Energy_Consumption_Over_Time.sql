SELECT 
    a.activity_date,
    SUM(a.energy_consumption) AS total_energy_consumption
FROM 
    Activities a
GROUP BY 
    a.activity_date
ORDER BY 
    a.activity_date;