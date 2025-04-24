--показывает превосходства типов, которые меняют урон атаки(т.е. делают атаку супер-эффективной, не эффективной или не имеющей эффекта)
SELECT 
    a.type_name as attack_type,
    d.type_name as defense_type,
    COALESCE(s.dmg_multiplier, 1) as multiplier
FROM element_type a
FULL JOIN Superiority_of_types s ON a.type_id = s.attack_type_id
FULL JOIN element_type d ON s.defender_type_id = d.type_id
where s.dmg_multiplier != 1;