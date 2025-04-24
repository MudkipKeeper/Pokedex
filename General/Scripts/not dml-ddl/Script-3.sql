--Рейтинг покемонов которых поменяли в Pokemon Emerald (рейтинг по atk)
SELECT p.pokemon_name, (pv.atk_in_version + pv.spec_atk_in_version) AS emerald_attack
FROM pokemon_in_versions pv
JOIN Game_version v ON pv.version_id = v.version_id
JOIN Pokemon p ON pv.pokemon_id = p.pokemon_id
WHERE v.version_name = 'Pokemon Emerald'
ORDER BY emerald_attack DESC
LIMIT 3;