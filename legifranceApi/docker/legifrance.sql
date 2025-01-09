CREATE DATABASE code_penal;
\connect code_penal

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_du_travail;
\connect code_du_travail

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_l_action_sociale_et_des_familles;
\connect code_de_l_action_sociale_et_des_familles

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_l_artisanat;
\connect code_de_l_artisanat

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_des_assurances;
\connect code_des_assurances

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_l_aviation_civile;
\connect code_de_l_aviation_civile

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_du_cinéma_et_de_l_image_animée;
\connect code_du_cinéma_et_de_l_image_animée

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_civil;
\connect code_civil

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_commande_publique;
\connect code_de_la_commande_publique

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_commerce;
\connect code_de_commerce

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_des_communes;
\connect code_des_communes

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_des_communes_de_la_nouvelle_calédonie;
\connect code_des_communes_de_la_nouvelle_calédonie

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_consommation;
\connect code_de_la_consommation

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_construction_et_de_l_habitation;
\connect code_de_la_construction_et_de_l_habitation

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_défense;
\connect code_de_la_défense

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_déontologie_des_architectes;
\connect code_de_déontologie_des_architectes

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_disciplinaire_et_pénal_de_la_marine_marchande;
\connect code_disciplinaire_et_pénal_de_la_marine_marchande

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_du_domaine_de_l_etat;
\connect code_du_domaine_de_l_etat

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_du_domaine_public_fluvial_et_de_la_navigation_intérieure;
\connect code_du_domaine_public_fluvial_et_de_la_navigation_intérieure

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_des_douanes;
\connect code_des_douanes

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_des_douanes_de_mayotte;
\connect code_des_douanes_de_mayotte

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_l_éducation;
\connect code_de_l_éducation

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_électoral;
\connect code_électoral

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_l_énergie;
\connect code_de_l_énergie

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_d_entrée_et_séjour_des_étrangers_et_du_droit_d_asile;
\connect code_d_entrée_et_séjour_des_étrangers_et_du_droit_d_asile

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_l_environnement;
\connect code_de_l_environnement

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_l_expropriation_pour_cause_d_utilité_publique;
\connect code_de_l_expropriation_pour_cause_d_utilité_publique

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_famille_et_de_l_aide_sociale;
\connect code_de_la_famille_et_de_l_aide_sociale

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_forestier_nouveau;
\connect code_forestier_nouveau

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_général_de_la_fonction_publique;
\connect code_général_de_la_fonction_publique

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_général_de_la_propriété_des_personnes_publiques;
\connect code_général_de_la_propriété_des_personnes_publiques

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_général_des_collectivités_territoriales;
\connect code_général_des_collectivités_territoriales

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_général_des_impôts;
\connect code_général_des_impôts

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_des_instruments_monétaires_et_des_médailles;
\connect code_des_instruments_monétaires_et_des_médailles

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_des_juridictions_financières;
\connect code_des_juridictions_financières

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_justice_administrative;
\connect code_de_justice_administrative

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_justice_militaire_nouveau;
\connect code_de_justice_militaire_nouveau

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_justice_pénale_des_mineurs;
\connect code_de_la_justice_pénale_des_mineurs

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_légion_d_honneur;
\connect code_de_la_légion_d_honneur

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE livre_des_procédures_fiscales;
\connect livre_des_procédures_fiscales

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_minier;
\connect code_minier

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_monétaire_et_financier;
\connect code_monétaire_et_financier

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_mutualité;
\connect code_de_la_mutualité

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_l_organisation_judiciaire;
\connect code_de_l_organisation_judiciaire

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_du_patrimoine;
\connect code_du_patrimoine

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_pénitentiaire;
\connect code_pénitentiaire

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_des_pensions_civiles_et_militaires_de_retraite;
\connect code_des_pensions_civiles_et_militaires_de_retraite

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_des_ports_maritimes;
\connect code_des_ports_maritimes

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_des_postes_et_des_communications_électroniques;
\connect code_des_postes_et_des_communications_électroniques

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_procédure_civile;
\connect code_de_procédure_civile

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_procédure_pénale;
\connect code_de_procédure_pénale

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_propriété_intellectuelle;
\connect code_de_la_propriété_intellectuelle

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_rural_et_de_la_pêche_maritime;
\connect code_rural_et_de_la_pêche_maritime

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_santé_publique;
\connect code_de_la_santé_publique

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_sécurité_intérieure;
\connect code_de_la_sécurité_intérieure

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_sécurité_sociale;
\connect code_de_la_sécurité_sociale

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_du_sport;
\connect code_du_sport

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_l_urbanisme;
\connect code_de_l_urbanisme

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);

CREATE DATABASE code_de_la_voirie_routière;
\connect code_de_la_voirie_routière

CREATE TABLE parts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE parties (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id)
);

CREATE TABLE titres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id)
);

CREATE TABLE chapitres (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id)
);

CREATE TABLE sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id)
);

CREATE TABLE sous_sections (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id)
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    part_id INT REFERENCES parts(id) ON DELETE CASCADE,
    partie_id INT REFERENCES parties(id) ON DELETE CASCADE,
    livre_id INT REFERENCES livres(id) ON DELETE CASCADE,
    titre_id INT REFERENCES titres(id) ON DELETE CASCADE,
    chapitre_id INT REFERENCES chapitres(id) ON DELETE CASCADE,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    sous_section_id INT REFERENCES sous_sections(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    UNIQUE (title, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)
);