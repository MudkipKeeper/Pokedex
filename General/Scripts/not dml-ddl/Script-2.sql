--Покемоны с эволюцией "other"(т.е. у которых эволюция не уровневая)
SELECT pokemon_name 
FROM pokemon p
WHERE EXISTS (
    SELECT 1 FROM pokemon_evolution e 
    WHERE e.from_pokemon_id = p.pokemon_id 
    AND e.requirement = 'other'
);