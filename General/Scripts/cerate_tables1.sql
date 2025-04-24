CREATE TABLE element_type (
    type_id    SERIAL primary key,
    type_name  VARCHAR(100) not null unique
);

create table pokemon (
    pokemon_id SERIAL primary key,
    pokemon_name VARCHAR(100) not null unique,
    primary_type_id INTEGER not null,
    secondary_type_id INTEGER,
    hp INTEGER not null,
    atk INTEGER not null,
    spec_atk INTEGER not null,
    def INTEGER not null,
    spec_def INTEGER not null,
    foreign key (primary_type_id) references element_type(type_id),
    foreign key (secondary_type_id) references element_type(type_id)
);

create table attack (
    attack_id SERIAL primary key,
    attack_name VARCHAR(100) not null unique,
    type_id INTEGER not null,
    attack_category VARCHAR(10) not null,  -- Допустимые значения: 'status', 'physical', 'special'
    power INTEGER not null,
    accuracy INTEGER,
    attack_description VARCHAR(500),
    foreign key (type_id) references element_type(type_id),
    check (attack_category IN ('status', 'physical', 'special'))
);

create table superiority_of_types (
    attack_type_id INTEGER not null,
    defender_type_id INTEGER not null,
    dmg_multiplier REAL not null,  -- Допустимые значения: 0, 0.5, 1, 2
    primary key (attack_type_id, defender_type_id),
    foreign key (attack_type_id) references element_type(type_id),
    foreign key (defender_type_id) references element_type(type_id),
    check (dmg_multiplier in (0, 0.5, 1, 2))
);

create table abilities (
    ability_id SERIAL primary key,
    ability_name VARCHAR(100) NOT null unique,
    ability_description VARCHAR(500) NOT null
);

create table pokemon_abilities (
    pokemon_id INTEGER not null,
    ability_id INTEGER not null,
    primary key (pokemon_id, ability_id),
    foreign key (pokemon_id) references pokemon(pokemon_id),
    foreign key (ability_id) references abilities(ability_id)
);

create table pokemon_attack (
    pokemon_id INTEGER not null,
    attack_id  INTEGER not null,
    primary key (pokemon_id, attack_id),
    foreign key (pokemon_id) references pokemon(pokemon_id),
    foreign key (attack_id) references attack(attack_id)
);

create table game_version (
    version_id SERIAL primary key,
    version_name VARCHAR(100) NOT NULL UNIQUE
);

create table pokemon_in_versions (
    pokemon_id INTEGER not null,
    version_id INTEGER not null,
    hp_in_version INTEGER not null,
    atk_in_version INTEGER not null,
    def_in_version INTEGER not null,
    spec_atk_in_version INTEGER not null,
    spec_def_in_version INTEGER not null,
    primary key (pokemon_id, version_id),
    foreign key (pokemon_id) references pokemon(pokemon_id),
    foreign key (version_id) references game_version(version_id)
);

create table pokemon_evolution (
	from_pokemon_id INTEGER not null,
	to_pokemon_id INTEGER not null,
	requirement VARCHAR(100) not null,  -- Допустимые значения: 'lvl', 'other'
	requirement_descryption VARCHAR(500) not null,
	primary key (from_pokemon_id, to_pokemon_id),
	foreign key (from_pokemon_id) references pokemon(pokemon_id),
	foreign key (to_pokemon_id) references pokemon(pokemon_id),
	check (requirement in ('lvl', 'other'))
);