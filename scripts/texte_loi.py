import requests

token_url = "https://oauth.piste.gouv.fr/api/oauth/token"
api_url = 'https://api.piste.gouv.fr/dila/legifrance/lf-engine-app/'

client_id = "1262221e-e5c6-4be9-87cc-eeca59b4e9c9"
client_secret = "ccad24f2-4485-4109-9890-d91e87e12cbb"
token = ''

data = {
    'grant_type': 'client_credentials',
    'client_id': client_id,
    'client_secret': client_secret,
    'scope': 'openid'
}

headers = {
    "Content-Type": "application/x-www-form-urlencoded"
}

response = requests.post(token_url, data=data, headers=headers)
if 200 <= response.status_code < 300:
    token = response.json().get('access_token')
    token = token
    expires_in = response.json().get('expires_in')
    print('Login successful')

print(response.status_code)
print(response.text)