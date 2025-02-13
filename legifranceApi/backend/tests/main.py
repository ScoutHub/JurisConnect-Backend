from typing import Annotated

from fastapi import FastAPI, Header, HTTPException
from pydantic import BaseModel

fake_secret_token = "coneofsilence"

code_civil = {
    "parts": {
        1: {"id": 1, "title": "Default Path"},
        2: {"id": 10, "title": "Livre IV : Des sûretés"},
    },
    "parties": {
        1: {"id": 1, "part_id": 1, "title": "Partie 1-1"},
        2: {"id": 2, "part_id": 1, "title": "Partie 1-2"},
        3: {"id": 3, "part_id": 2, "title": "Partie 2-1"},
    },
    "livres": {
        1: {"id": 1, "part_id": 1, "partie_id": 1, "title": "Livre 1-1-1"},
        2: {"id": 2, "part_id": 1, "partie_id": 2, "title": "Livre 1-2-1"},
        3: {"id": 3, "part_id": 2, "partie_id": 3, "title": "Livre 2-1-1"},
    },
    "titres": {
        1: {"id": 1, "part_id": 1, "partie_id": 1, "livre_id": 1, "title": "Titre 1-1-1-1"},
        2: {"id": 2, "part_id": 1, "partie_id": 2, "livre_id": 2, "title": "Titre 1-2-1-1"},
    },
    "chapitres": {
        1: {"id": 1, "part_id": 1, "partie_id": 1, "livre_id": 1, "titre_id": 1, "title": "Chapitre 1-1-1-1-1"},
    },
    "sections": {
        1: {"id": 1, "part_id": 1, "partie_id": 1, "livre_id": 1, "titre_id": 1, "chapitre_id": 1, "title": "Section 1-1-1-1-1-1"},
    },
    "sous_sections": {
        1: {"id": 1, "part_id": 1, "partie_id": 1, "livre_id": 1, "titre_id": 1, "chapitre_id": 1, "section_id": 1, "title": "Sous-Section 1-1-1-1-1-1-1"},
    },
    "articles": {
        1: {
            "id": 1,
            "part_id": 1,
            "partie_id": 1,
            "livre_id": 1,
            "titre_id": 1,
            "chapitre_id": 1,
            "section_id": 1,
            "sous_section_id": 1,
            "title": "Article 1-1-1-1-1-1-1-1",
            "content": "This is the content of Article 1-1-1-1-1-1-1-1",
        },
    },
}

app = FastAPI()


@app.get("/code_civil/parts", response_model=list[dict])
async def read_parts(x_api_key: Annotated[str, Header(alias="X-API-KEY")]):
    if x_api_key != fake_secret_token:
        raise HTTPException(status_code=400, detail="Could not validate credentials")
    return list(code_civil["parts"].values())


@app.get("/code_civil/{item}/{item_id}", response_model=dict)
async def read_item(item: str, item_id: int, x_api_key: Annotated[str, Header(alias="X-API-KEY")]):
    if x_api_key != fake_secret_token:
        raise HTTPException(status_code=400, detail="Could not validate credentials")
    if item not in code_civil or item_id not in code_civil[item]:
        raise HTTPException(status_code=404, detail="Item not found")
    return code_civil[item][item_id]
