from fastapi import HTTPException, Security
from fastapi.security.api_key import APIKeyHeader
import os
from dotenv import load_dotenv

load_dotenv()

load_dotenv(dotenv_path='.env')

API_KEY_NAME = os.getenv("API_KEY_NAME")
API_KEYS = os.getenv("API_KEYS").split(",")

if not API_KEY_NAME:
    raise ValueError("API_KEY_NAME must be set in the .env file.")
if not API_KEYS or API_KEYS == [""]:
    raise ValueError("API_KEYS must contain at least one valid key.")

api_key_header = APIKeyHeader(name=API_KEY_NAME, auto_error=False)

async def get_api_key(api_key_header: str = Security(api_key_header)):
    if api_key_header in API_KEYS:
        return api_key_header
    else:
        raise HTTPException(
            status_code=403,
            detail="Could not validate credentials",
        )