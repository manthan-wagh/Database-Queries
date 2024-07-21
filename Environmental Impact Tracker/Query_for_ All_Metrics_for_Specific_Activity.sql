SELECT 
    im.metric_name,
    im.metric_value,
    im.unit,
    im.recorded_at
FROM 
    Impact_Metrics im
    JOIN Activities a ON im.activity_id = a.activity_id
WHERE 
    a.activity_id = 1;