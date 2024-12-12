import requests
from json import dumps
from time import sleep
from typing import List

TOKEN_URL = "https://sandbox-oauth.piste.gouv.fr/api/oauth/token"
API_URL = 'https://sandbox-api.piste.gouv.fr'

CLIENT_ID = ""
CLIENT_SECRET = ""

def get_token() -> str:
    """Get token of legifrance.\n
    return:
        str
    """
    print('Login to get token...')
    headers = {
        "Content-Type": "application/x-www-form-urlencoded"
    }

    data = {
        'grant_type': 'client_credentials',
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_SECRET,
        'scope': 'openid'
    }

    response = requests.post(TOKEN_URL, data=data, headers=headers, timeout=3)
    if 200 <= response.status_code < 300:
        token = response.json().get('access_token')
        token = token
        print('Login successful')
        return token
    else:
        return None

def get_articles_ref(token: str) -> List[object]:
    """Get articles reference. \n
    params:
        token: str
    return:
        List[object]
    """
    print('Fetching articles references...')
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
            print(f'articles fetched for page {page_number}')
            articles += r.json()['results']
            print(f'articles added, len: {len(articles)}')
            page_number += 1
            if(len(r.json()['results']) < 100):
                break
            sleep(5)
    
    return articles

def get_articles(token: str) -> List[object]:
    """Fetching articles of article reference. \n
    params:
        token: str
    return:
        List[object]
    """
    print('Login to get articles...')
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
    """Save articles reference in json file 'ref_articles.json' file. \n
    params:
        articles_ref: List[object]
    """
    file_path = "ref_articles.json"
    try:
        with open(file_path, 'w') as f:
            f.write(dumps(articles_ref))
            f.close()
        print(f'SUCCESS: File successfuly saved in {file_path}')
    except ValueError as err:
        print(f'ERROR: an error occured while saving articles: {err.args}')

def save_articles(articles: List[object]):
    """Save articles in json file 'content_articles.json' file. \n
    params:
        articles: List[object]
    """
    file_path = "content_articles.json"
    try:
        with open(file_path, 'w') as f:
            f.write(dumps(articles))
            f.close()
        print(f'SUCCESS: File successfuly saved in {file_path}')
    except ValueError as err:
        print(f'ERROR: an error occured while saving articles: {err.args}')

if __name__ == "__main__":
    token = get_token()
    if(token):
        articles_ref = get_articles_ref(token)
        save_articles_ref(articles_ref)
        articles = get_articles(token)
        save_articles(articles)
