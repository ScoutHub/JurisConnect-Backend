import json
import psycopg2
import re
from dotenv import load_dotenv
import os

def clean_html(content):
    
    return re.sub(r'<.*?>', '', content).strip()

def clean_json(file_path, output_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            data = json.load(file) 
        with open(output_path, 'w', encoding='utf-8') as file:
            json.dump(data, file, indent=2, ensure_ascii=False) 
        print("JSON nettoyé et enregistré dans :", output_path)
    except json.JSONDecodeError as e:
        print(f"Erreur dans le fichier JSON : {e}")
        raise
    return output_path

def insert_or_get_id(cursor, table, unique_columns, data):
    print(f"Traitement de la table {table} avec les données : {data}")
    columns = ", ".join(data.keys())
    placeholders = ", ".join(["%s"] * len(data))
    conflict_columns = ", ".join(unique_columns)
    query = f"""
        INSERT INTO {table} ({columns})
        VALUES ({placeholders})
        ON CONFLICT ({conflict_columns}) DO NOTHING
        RETURNING id;
    """
    cursor.execute(query, tuple(data.values()))
    result = cursor.fetchone()
    if result:
        print(f"ID inséré dans {table} : {result[0]}")
        return result[0]

    where_clause = " AND ".join([f"{col} = %s" for col in unique_columns])
    query = f"SELECT id FROM {table} WHERE {where_clause};"
    cursor.execute(query, tuple(data[col] for col in unique_columns))
    result = cursor.fetchone()
    if result:
        print(f"ID existant dans {table} : {result[0]}")
        return result[0]
    print(f"Aucune donnée insérée ou trouvée dans {table}.")
    return None

def process_article(cursor, article, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id):
    
    if "pathTitle" in article and article["pathTitle"]:
        path_title = article["pathTitle"]
        part_title = path_title[0] if len(path_title) > 0 else None
        partie_title = path_title[1] if len(path_title) > 1 else None
        livre_title = path_title[2] if len(path_title) > 2 else None
        titre_title = path_title[3] if len(path_title) > 3 else None
        chapitre_title = path_title[4] if len(path_title) > 4 else None
        section_title = path_title[5] if len(path_title) > 5 else None
        sous_section_title = path_title[6] if len(path_title) > 6 else None

        part_id = insert_or_get_id(cursor, "parts", ["title"], {"title": part_title})
        partie_id = insert_or_get_id(cursor, "parties", ["title", "part_id"], {"title": partie_title, "part_id": part_id}) if partie_title else None
        livre_id = insert_or_get_id(cursor, "livres", ["title", "part_id", "partie_id"], {"title": livre_title, "part_id": part_id, "partie_id": partie_id}) if livre_title else None
        titre_id = insert_or_get_id(cursor, "titres", ["title", "part_id", "partie_id", "livre_id"], {"title": titre_title, "part_id": part_id, "partie_id": partie_id, "livre_id": livre_id}) if titre_title else None
        chapitre_id = insert_or_get_id(cursor, "chapitres", ["title", "part_id", "partie_id", "livre_id", "titre_id"], {"title": chapitre_title, "part_id": part_id, "partie_id": partie_id, "livre_id": livre_id, "titre_id": titre_id}) if chapitre_title else None
        section_id = insert_or_get_id(cursor, "sections", ["title", "part_id", "partie_id", "livre_id", "titre_id", "chapitre_id"], {"title": section_title, "part_id": part_id, "partie_id": partie_id, "livre_id": livre_id, "titre_id": titre_id, "chapitre_id": chapitre_id}) if section_title else None
        sous_section_id = insert_or_get_id(cursor, "sous_sections", ["title", "part_id", "partie_id", "livre_id", "titre_id", "chapitre_id", "section_id"], {"title": sous_section_title, "part_id": part_id, "partie_id": partie_id, "livre_id": livre_id, "titre_id": titre_id, "chapitre_id": chapitre_id, "section_id": section_id}) if sous_section_title else None

    article_data = {
        "title": article.get("num", "Article sans titre"),
        "content": clean_html(article.get("content", "")),
        "part_id": part_id,
        "partie_id": partie_id,
        "livre_id": livre_id,
        "titre_id": titre_id,
        "chapitre_id": chapitre_id,
        "section_id": section_id,
        "sous_section_id": sous_section_id,
    }
    print(f"Traitement de l'article : {article_data}")
    insert_or_get_id(cursor, "articles", ["title", "part_id", "partie_id", "livre_id", "titre_id", "chapitre_id", "section_id", "sous_section_id"], article_data)

def process_data(cursor, data):

    for item in data:
        if "pathTitle" not in item or not item["pathTitle"]:
            print(f"Avertissement : 'pathTitle' manquant ou invalide pour l'élément ID {item.get('id', 'ID inconnu')}")
            item["pathTitle"] = ["Chemin par défaut", "Non classifié"]
        
        print(f"Traitement de pathTitle : {item['pathTitle']}")

        part_title = item["pathTitle"][0]
        part_id = insert_or_get_id(cursor, "parts", ["title"], {"title": part_title})

        partie_id = None
        if len(item["pathTitle"]) > 1:
            partie_title = item["pathTitle"][1]
            partie_id = insert_or_get_id(cursor, "parties", ["title", "part_id"], {"title": partie_title, "part_id": part_id})

        livre_id = None
        if len(item["pathTitle"]) > 2:
            livre_title = item["pathTitle"][2]
            livre_id = insert_or_get_id(cursor, "livres", ["title", "part_id", "partie_id"], {"title": livre_title, "part_id": part_id, "partie_id": partie_id})

        titre_id = None
        if len(item["pathTitle"]) > 3:
            titre_title = item["pathTitle"][3]
            titre_id = insert_or_get_id(cursor, "titres", ["title", "part_id", "partie_id", "livre_id"], {"title": titre_title, "part_id": part_id, "partie_id": partie_id, "livre_id": livre_id})

        chapitre_id = None
        if len(item["pathTitle"]) > 4:
            chapitre_title = item["pathTitle"][4]
            chapitre_id = insert_or_get_id(cursor, "chapitres", ["title", "part_id", "partie_id", "livre_id", "titre_id"], {"title": chapitre_title, "part_id": part_id, "partie_id": partie_id, "livre_id": livre_id, "titre_id": titre_id})

        section_id = None
        if len(item["pathTitle"]) > 5:
            section_title = item["pathTitle"][5]
            section_id = insert_or_get_id(cursor, "sections", ["title", "part_id", "partie_id", "livre_id", "titre_id", "chapitre_id"], {"title": section_title, "part_id": part_id, "partie_id": partie_id, "livre_id": livre_id, "titre_id": titre_id, "chapitre_id": chapitre_id})

        sous_section_id = None
        if len(item["pathTitle"]) > 6:
            sous_section_title = item["pathTitle"][6]
            sous_section_id = insert_or_get_id(cursor, "sous_sections", ["title", "part_id", "partie_id", "livre_id", "titre_id", "chapitre_id", "section_id"], {"title": sous_section_title, "part_id": part_id, "partie_id": partie_id, "livre_id": livre_id, "titre_id": titre_id, "chapitre_id": chapitre_id, "section_id": section_id})

        if "articles" in item:
            for article in item["articles"]:
                process_article(cursor, article, part_id, partie_id, livre_id, titre_id, chapitre_id, section_id, sous_section_id)

        if "sections" in item:
            process_data(cursor, item["sections"])

def parse_json_to_db(file_path, db_config):

    try:
        connection = psycopg2.connect(**db_config)
        cursor = connection.cursor()

        print("Chargement et nettoyage du fichier JSON...")
        cleaned_file_path = clean_json(file_path, file_path.replace(".json", "_cleaned.json"))
        
        print("Chargement des données nettoyées...")
        with open(cleaned_file_path, 'r', encoding='utf-8') as file:
            data = json.load(file)

        print(f"{len(data)} éléments racine chargés depuis le JSON.")
        process_data(cursor, data)

        connection.commit()
        cursor.close()
        connection.close()
        print("Données insérées avec succès.")
    except Exception as e:
        print(f"Une erreur s'est produite : {e}")


if __name__ == "__main__":
    input_file_path = "/app/output/content_articles.json" 
    load_dotenv()

    db_config = {
        'dbname': os.getenv('DB_NAME'),
        'user': os.getenv('DB_USER'),
        'password': os.getenv('DB_PASSWORD'),
        'host': os.getenv('DB_HOST'),
        'port': os.getenv('DB_PORT')
    }
    parse_json_to_db(input_file_path, db_config)
