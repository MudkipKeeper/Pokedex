--Выводит эволюции меняющие первичный тип покемона
SELECT 
    p1.pokemon_name as from_pokemon,
    p2.pokemon_name as to_pokemon
FROM pokemon_evolution e
JOIN Pokemon p1 ON e.from_pokemon_id = p1.pokemon_id
JOIN Pokemon p2 ON e.to_pokemon_id = p2.pokemon_id
WHERE p1.primary_type_id != p2.primary_type_id;