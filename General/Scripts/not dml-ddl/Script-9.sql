--Покемоны огненного типа с атакой > 80
SELECT p.pokemon_name, t.type_name, p.atk 
FROM pokemon p
JOIN element_type t ON p.primary_type_id = t.type_id
WHERE t.type_name = 'Огненный' AND p.atk > 80
ORDER BY p.atk DESC;