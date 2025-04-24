--Топ-5 самых сильных физических атак
SELECT a.attack_name, t.type_name, a.power 
FROM attack a
JOIN element_type t ON a.type_id = t.type_id
WHERE a.attack_category = 'physical'
ORDER BY a.power DESC
LIMIT 5;