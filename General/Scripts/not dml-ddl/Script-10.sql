--Типы с >2 покемонами и средней HP >70
SELECT t.type_name, COUNT(*) as cnt, AVG(p.hp) avg_hp
FROM pokemon p
JOIN element_type t ON p.primary_type_id = t.type_id
GROUP BY t.type_name
HAVING COUNT(*) > 2 AND AVG(p.hp) > 50;