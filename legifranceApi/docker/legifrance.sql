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
