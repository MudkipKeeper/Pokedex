SELECT 
    t.type_name,
    COUNT(*) FILTER (WHERE attack_category = 'physical') as physical,
    COUNT(*) FILTER (WHERE attack_category = 'special') as special,
    COUNT(*) FILTER (WHERE attack_category = 'status') as status
FROM Attack a
JOIN element_type t ON a.type_id = t.type_id
GROUP BY t.type_name;