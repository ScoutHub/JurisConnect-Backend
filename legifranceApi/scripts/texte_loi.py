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
                        "valeur": os.getenv('CODE'),
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
        "textId": os.getenv('TEXTID'),
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
    # print(f"Processing table {table} with data: {data}")
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
        # print(f"ID inserted in {table}: {result[0]}")
        return result[0]

    where_clause = " AND ".join([f"{col} = %s" for col in unique_columns])
    query = f"SELECT id FROM {table} WHERE {where_clause};"
    cursor.execute(query, tuple(data[col] for col in unique_columns))
    result = cursor.fetchone()
    if result:
        # print(f"Existing ID in {table}: {result[0]}")
        return result[0]
    # print(f"No data inserted or found in {table}.")
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
    # print(f"Processing article: {article_data}")
    insert_or_get_id(cursor, "articles", ["title", "part_id", "partie_id", "livre_id", "titre_id", "chapitre_id", "section_id", "sous_section_id"], article_data)

def process_data(cursor, data):

    for item in data:
        if "pathTitle" not in item or not item["pathTitle"]:
            # print(f"Warning: 'pathTitle' missing or invalid for item ID {item.get('id', 'Unknown ID')}")
            item["pathTitle"] = ["Default Path", "Unclassified"]
        
        # print(f"Processing pathTitle: {item['pathTitle']}")

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

import os
from dotenv import load_dotenv

load_dotenv()

def process_code(code: str, textid: str):
    """Process a single code."""
    os.environ['CODE'] = code
    os.environ['TEXTID'] = textid

    logging.info(f"Fetching data for CODE: {code}, TEXTID: {textid}")
    
    # 1. Obtenir le token
    token = get_token()
    if token is None:
        logging.error(f"Failed to get token for CODE={code}, TEXTID={textid}")
        return

    logging.info(f"Successfully obtained token for CODE: {code}")

    # 2. Obtenir les références des articles
    logging.info(f"Fetching article references for CODE: {code}")
    articles_ref = get_articles_ref(token)
    save_articles_ref(articles_ref)
    logging.info(f"Article references saved for CODE: {code}")

    # 3. Obtenir le contenu des articles
    logging.info(f"Fetching article content for CODE: {code}")
    articles = get_articles(token)
    save_articles(articles)
    logging.info(f"Article content saved for CODE: {code}")

    # 4. Charger les données dans la base de données
    logging.info(f"Inserting data into the database for CODE: {code}")
    input_file_path = "content_articles.json"
    
    # Set the DB_HOST based on the code
    db_name = (
        "code_penal" if "pénal" in code else
        "code_du_travail" if "travail" in code else
        "code_de_l_action_sociale_et_des_familles" if "action sociale et des familles" in code else
        "code_de_l_artisanat" if "artisanat" in code else
        "code_des_assurances" if "assurances" in code else
        "code_de_l_aviation_civile" if "aviation civile" in code else
        "code_du_cinéma_et_de_l_image_animée" if "cinéma et de l'image animée" in code else
        "code_civil" if "civil" in code else
        "code_de_la_commande_publique" if "commande publique" in code else
        "code_de_commerce" if "commerce" in code else
        "code_des_communes" if "communes" in code else
        "code_des_communes_de_la_nouvelle_calédonie" if "communes de la Nouvelle-Calédonie" in code else
        "code_de_la_consommation" if "consommation" in code else
        "code_de_la_construction_et_de_l_habitation" if "construction et de l'habitation" in code else
        "code_de_la_défense" if "défense" in code else
        "code_de_déontologie_des_architectes" if "déontologie des architectes" in code else
        "code_disciplinaire_et_pénal_de_la_marine_marchande" if "disciplinaire et pénal de la marine marchande" in code else
        "code_du_domaine_de_l_etat" if "domaine de l'Etat" in code else
        "code_du_domaine_de_l_etat_et_des_collectivités_publiques_applicable_à_la_collectivité_territoriale_de_mayotte" if "domaine de l'Etat et des collectivités publiques applicable à la collectivité territoriale de Mayotte" in code else
        "code_du_domaine_public_fluvial_et_de_la_navigation_intérieure" if "domaine public fluvial et de la navigation intérieure" in code else
        "code_des_douanes" if "douanes" in code else
        "code_des_douanes_de_mayotte" if "douanes de Mayotte" in code else
        "code_de_l_éducation" if "éducation" in code else
        "code_électoral" if "électoral" in code else
        "code_de_l_énergie" if "énergie" in code else
        "code_d_entrée_et_séjour_des_étrangers_et_du_droit_d_asile" if "entrée et du séjour des étrangers et du droit d'asile" in code else
        "code_de_l_environnement" if "environnement" in code else
        "code_de_l_expropriation_pour_cause_d_utilité_publique" if "expropriation pour cause d'utilité publique" in code else
        "code_de_la_famille_et_de_l_aide_sociale" if "famille et de l'aide sociale" in code else
        "code_forestier_nouveau" if "forestier (nouveau)" in code else
        "code_général_de_la_fonction_publique" if "général de la fonction publique" in code else
        "code_général_de_la_propriété_des_personnes_publiques" if "général de la propriété des personnes publiques" in code else
        "code_général_des_collectivités_territoriales" if "général des collectivités territoriales" in code else
        "code_général_des_impôts" if "général des impôts" in code else
        "code_général_des_impôts_annexe_1" if "général des impôts, annexe I" in code else
        "code_général_des_impôts_annexe_2" if "général des impôts, annexe II" in code else
        "code_général_des_impôts_annexe_3" if "général des impôts, annexe III" in code else
        "code_général_des_impôts_annexe_4" if "général des impôts, annexe IV" in code else
        "code_des_impositions_sur_les_biens_et_services" if "impositions sur les biens et services" in code else
        "code_des_instruments_monétaires_et_des_médailles" if "instruments monétaires et des médailles" in code else
        "code_des_juridictions_financières" if "juridictions financières" in code else
        "code_de_justice_administrative" if "justice administrative" in code else
        "code_de_justice_militaire_nouveau" if "justice militaire (nouveau)" in code else
        "code_de_la_justice_pénale_des_mineurs" if "justice pénale des mineurs" in code else
        "code_de_la_légion_d_honneur" if "légion d'honneur, de la médaille militaire et de l'ordre national du mérite" in code else
        "livre_des_procédures_fiscales" if "livre des procédures fiscales" in code else
        "code_minier" if "minier" in code else
        "code_minier_nouveau" if "minier (nouveau)" in code else
        "code_monétaire_et_financier" if "monétaire et financier" in code else
        "code_de_la_mutualité" if "mutualité" in code else
        "code_de_l_organisation_judiciaire" if "organisation judiciaire" in code else
        "code_du_patrimoine" if "patrimoine" in code else
        "code_pénitentiaire" if "pénitentiaire" in code else
        "code_des_pensions_civiles_et_militaires_de_retraite" if "pensions civiles et militaires de retraite" in code else
        "code_des_pensions_de_retraite_des_marins_français_du_commerce_de_pêche_ou_de_plaisance" if "pensions de retraite des marins français du commerce, de pêche ou de plaisance" in code else
        "code_des_pensions_militaires_d_invalidité_et_des_victimes_de_guerre" if "pensions militaires d'invalidité et des victimes de guerre" in code else
        "code_des_ports_maritimes" if "ports maritimes" in code else
        "code_des_postes_et_des_communications_électroniques" if "postes et des communications électroniques" in code else
        "code_de_procédure_civile" if "procédure civile" in code else
        "code_de_procédure_pénale" if "procédure pénale" in code else
        "code_des_procédures_civiles_d_exécution" if "procédures civiles d'exécution" in code else
        "code_de_la_propriété_intellectuelle" if "propriété intellectuelle" in code else
        "code_de_la_recherche" if "recherche" in code else
        "code_des_relations_entre_le_public_et_l_administration" if "relations entre le public et l'administration" in code else
        "code_de_la_route" if "route" in code else
        "code_rural_ancien" if "rural (ancien)" in code else
        "code_rural_et_de_la_pêche_maritime" if "rural et de la pêche maritime" in code else
        "code_de_la_santé_publique" if "santé publique" in code else
        "code_de_la_sécurité_intérieure" if "sécurité intérieure" in code else
        "code_de_la_sécurité_sociale" if "sécurité sociale" in code else
        "code_du_service_national" if "service national" in code else
        "code_du_sport" if "sport" in code else
        "code_du_tourisme" if "tourisme" in code else
        "code_des_transports" if "transports" in code else
        "code_du_travail_maritime" if "travail maritime" in code else
        "code_de_l_urbanisme" if "urbanisme" in code else
        "code_de_la_voirie_routière" if "voirie routière" in code else
        None
    )
    
    db_config = {
        'dbname': db_name,
        'user': os.getenv('DB_USER'),
        'password': os.getenv('DB_PASSWORD'),
        'host': os.getenv('DB_HOST'),
        'port': os.getenv('DB_PORT')
    }
    parse_json_to_db(input_file_path, db_config)
    logging.info(f"Database insertion completed for CODE: {code}")

if __name__ == "__main__":
    # Charger les variables d'environnement pour les différents codes
    codes = os.getenv("CODE", "").split(",")
    textids = os.getenv("TEXTID", "").split(",")

    # Vérifiez si les variables sont correctement chargées
    if not codes or not textids:
        logging.error("CODES or TEXTIDS are missing in the .env file.")
        exit(1)
    
    if len(codes) != len(textids):
        logging.error("Mismatch between number of CODES and TEXTIDS in .env file.")
        exit(1)

    for code, textid in zip(codes, textids):
        code = code.strip()  # Supprime les espaces superflus
        textid = textid.strip()

        if not code or not textid:
            logging.warning(f"Skipping processing due to empty CODE or TEXTID: CODE='{code}', TEXTID='{textid}'")
            continue

        logging.info(f"Starting processing for CODE: {code} with TEXTID: {textid}")
        process_code(code, textid)
        logging.info(f"Finished processing for CODE: {code} with TEXTID: {textid}")
