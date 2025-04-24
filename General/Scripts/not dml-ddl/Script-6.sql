--показывает все атаки, сила котрых больше любой физической
SELECT attack_name, power 
FROM Attack
WHERE power > ALL(
    SELECT power FROM Attack 
    WHERE attack_category = 'physical'
);