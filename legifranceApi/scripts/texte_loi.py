import requests
from json import dumps, load, dump
from time import sleep
from typing import List
import os
from dotenv import load_dotenv
import logging
import re
import psycopg2

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

logging.info("Starting script...")

load_dotenv()

TOKEN_URL = os.getenv('TOKEN_URL')
API_URL = os.getenv('API_URL')

def get_token() -> str:
    """Get token of legifrance.
    return:
        str
    """
    logging.info('Login to get token...')
    headers = {
        "Content-Type": "application/x-www-form-urlencoded"
    }

    data = {
        'grant_type': 'client_credentials',
        'client_id': os.getenv('CLIENT_ID'),
        'client_secret': os.getenv('CLIENT_SECRET'),
        'scope': 'openid'
    }

    response = requests.post(TOKEN_URL, data=data, headers=headers, timeout=3)
    if 200 <= response.status_code < 300:
        token = response.json().get('access_token')
        logging.info('Login successful')
        return token
    else:
        logging.error('Failed to get token')
        return None

def get_articles_ref(token: str) -> List[object]:
    """Get articles reference.
    params:
        token: str
    return:
        List[object]
    """
    logging.info('Fetching articles references...')
    headers = {
        "Authorization": f'Bearer {token}',
        "Content-Type": 'application/json'
    }
    page_number = 1
    articles = []
    while True:
        data = {
            "fond": "CODE_DATE",
            "recherche": {
                "filtres": [],
                "sort": "SIGNATURE_DATE_DESC",
                "fromAdvancedRecherche": "false",
                "secondSort": "ID",
                "champs": [
                {
                    "criteres": [
                    {
                        "valeur": "Code du Travail",
                        "operateur": "ET",
                        "typeRecherche": "EXACTE"
                    }
                    ],
                    "typeChamp": "TITLE",
                    "operateur": "ET"
                }
                ],
                "pageSize": 100,
                "operateur": "ET",
                "typePagination": "DEFAUT",
                "pageNumber": page_number
            }
        }
        data = dumps(data)

        r = requests.post(f'{API_URL}/dila/legifrance/lf-engine-app/search', headers=headers, data=data)
        if(r.status_code == 200):
            logging.info(f'articles fetched for page {page_number}')
            articles += r.json()['results']
            logging.info(f'articles added, len: {len(articles)}')
            page_number += 1
            if(len(r.json()['results']) < 100):
                break
            sleep(5)
    
    return articles

def get_articles(token: str) -> List[object]:
    """Fetching articles of article reference.
    params:
        token: str
    return:
        List[object]
    """
    logging.info('Login to get articles...')
    headers = {
        "Authorization": f'Bearer {token}',
        "Content-Type": 'application/json'
    }

    data = {
        "searchedString": "constitution 1958",
        "date": "2021-07-01",
        "textId": "LEGITEXT000006072050"
    }
    data = dumps(data)
    articles = []
    r = requests.post(f'{API_URL}/dila/legifrance/lf-engine-app/consult/legiPart', headers=headers, data=data)
    if(r.status_code == 200):
        articles += r.json()['sections']
    
    return articles

def save_articles_ref(articles_ref: List[object]):
    """Save articles reference in json file 'ref_articles.json' file.
    params:
        articles_ref: List[object]
    """
    file_path = "ref_articles.json"
    try:
        with open(file_path, 'w') as f:
            f.write(dumps(articles_ref))
            f.close()
        logging.info(f'SUCCESS: File successfully saved in {file_path}')
    except ValueError as err:
        logging.info(f'ERROR: an error occurred while saving articles: {err.args}')

def save_articles(articles: List[object]):
    """Save articles in json file 'content_articles.json' file.
    params:
        articles: List[object]
    """
    file_path = "content_articles.json"
    try:
        with open(file_path, 'w') as f:
            f.write(dumps(articles))
            f.close()
        logging.info(f'SUCCESS: File successfully saved in {file_path}')
    except ValueError as err:
        logging.info(f'ERROR: an error occurred while saving articles: {err.args}')
        
def clean_html(content):
    return re.sub(r'<.*?>', '', content).strip()

def clean_json(file_path, output_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            data = load(file) 
        with open(output_path, 'w', encoding='utf-8') as file:
           dump(data, file, indent=2, ensure_ascii=False) 
        print("JSON cleaned and saved in:", output_path)
    except ValueError as e:
        print(f"Error in JSON file: {e}")
        raise
    return output_path

def insert_or_get_id(cursor, table, unique_columns, data):
    print(f"Processing table {table} with data: {data}")
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
        print(f"ID inserted in {table}: {result[0]}")
        return result[0]

    where_clause = " AND ".join([f"{col} = %s" for col in unique_columns])
    query = f"SELECT id FROM {table} WHERE {where_clause};"
    cursor.execute(query, tuple(data[col] for col in unique_columns))
    result = cursor.fetchone()
    if result:
        print(f"Existing ID in {table}: {result[0]}")
        return result[0]
    print(f"No data inserted or found in {table}.")
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
        "title": article.get("num", "Untitled Article"),
        "content": clean_html(article.get("content", "")),
        "part_id": part_id,
        "partie_id": partie_id,
        "livre_id": livre_id,
        "titre_id": titre_id,
        "chapitre_id": chapitre_id,
        "section_id": section_id,
        "sous_section_id": sous_section_id,
    }
    print(f"Processing article: {article_data}")
    insert_or_get_id(cursor, "articles", ["title", "part_id", "partie_id", "livre_id", "titre_id", "chapitre_id", "section_id", "sous_section_id"], article_data)

def process_data(cursor, data):

    for item in data:
        if "pathTitle" not in item or not item["pathTitle"]:
            print(f"Warning: 'pathTitle' missing or invalid for item ID {item.get('id', 'Unknown ID')}")
            item["pathTitle"] = ["Default Path", "Unclassified"]
        
        print(f"Processing pathTitle: {item['pathTitle']}")

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

        print("Loading and cleaning JSON file...")
        cleaned_file_path = clean_json(file_path, file_path.replace(".json", "_cleaned.json"))
        
        print("Loading cleaned data...")
        with open(cleaned_file_path, 'r', encoding='utf-8') as file:
            data = load(file)

        print(f"{len(data)} root elements loaded from JSON.")
        process_data(cursor, data)

        connection.commit()
        cursor.close()
        connection.close()
        print("Data successfully inserted.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    token = get_token()
    if token:
        articles_ref = get_articles_ref(token)
        save_articles_ref(articles_ref)
        articles = get_articles(token)
        save_articles(articles)

        # Run the second script after the first script has completed
        input_file_path = "content_articles.json"
        db_config = {
            'dbname': os.getenv('DB_NAME'),
            'user': os.getenv('DB_USER'),
            'password': os.getenv('DB_PASSWORD'),
            'host': os.getenv('DB_HOST'),
            'port': os.getenv('DB_PORT')
        }
        parse_json_to_db(input_file_path, db_config)
