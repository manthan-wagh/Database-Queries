SELECT 
    im.metric_name,
    AVG(im.metric_value) AS average_value,
    im.unit
FROM 
    Impact_Metrics im
GROUP BY 
    im.metric_name, im.unit;
