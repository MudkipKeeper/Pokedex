--Сравнение hp покемона с предыдущей версией
WITH VersionStats AS (
    SELECT 
        pokemon_id,
        version_id,
        hp_in_version,
        LAG(hp_in_version) OVER(PARTITION BY pokemon_id ORDER BY version_id) prev_hp
    FROM pokemon_in_versions
)
SELECT * FROM VersionStats
WHERE prev_hp IS NOT NULL;