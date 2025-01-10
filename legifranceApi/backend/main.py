from fastapi import FastAPI, Depends, HTTPException, Request
from fastapi.responses import JSONResponse
from fastapi.exceptions import RequestValidationError
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select
from sqlalchemy.exc import SQLAlchemyError, IntegrityError, NoResultFound
from database import get_db
from models import Part, Partie, Livre, Article, Section, SousSection, Chapitre
from auth import get_api_key
from logging_middleware import LoggingMiddleware 

app = FastAPI()

app.add_middleware(LoggingMiddleware)

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.exception_handler(SQLAlchemyError)
async def sqlalchemy_exception_handler(request: Request, exc: SQLAlchemyError):
    return JSONResponse(
        status_code=500,
        content={"message": f"Database error: {str(exc)}"}
    )

@app.exception_handler(IntegrityError)
async def integrity_error_handler(request: Request, exc: IntegrityError):
    return JSONResponse(
        status_code=400,
        content={"message": f"Integrity error: {str(exc)}"}
    )

@app.exception_handler(NoResultFound)
async def no_result_found_handler(request: Request, exc: NoResultFound):
    return JSONResponse(
        status_code=404,
        content={"message": "Resource not found"}
    )

@app.exception_handler(RequestValidationError)
async def validation_exception_handler(request: Request, exc: RequestValidationError):
    return JSONResponse(
        status_code=422,
        content={"message": f"Validation error: {exc.errors()}"}
    )

@app.exception_handler(Exception)
async def general_exception_handler(request: Request, exc: Exception):
    return JSONResponse(
        status_code=500,
        content={"message": f"Server error: {str(exc)}"}
    )

@app.get("/{db_name}/parties/", dependencies=[Depends(get_api_key)])
async def get_parties(db_name: str, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Partie))
        parties = result.scalars().all()
        if not parties:
            raise HTTPException(status_code=404, detail="Parties not found")
        return parties
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))
    
@app.get("/{db_name}/parties/{partie_id}", dependencies=[Depends(get_api_key)])
async def get_partie(db_name: str, partie_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Partie).where(Partie.id == partie_id))
        partie = result.scalars().first()
        if not partie:
            raise HTTPException(status_code=404, detail="Partie not found")
        return partie
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/parts/", dependencies=[Depends(get_api_key)])
async def get_parts(db_name: str, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Part))
        parts = result.scalars().all()
        if not parts:
            raise HTTPException(status_code=404, detail="Parts not found")
        return parts
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/parts/{part_id}/parties/", dependencies=[Depends(get_api_key)])
async def get_parties(db_name: str, part_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Partie).where(Partie.part_id == part_id))
        parties = result.scalars().all()
        if not parties:
            raise HTTPException(status_code=404, detail="Parties not found")
        return parties
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/parts/{part_id}/parties/{partie_id}/livres/", dependencies=[Depends(get_api_key)])
async def get_livres(db_name: str, part_id: int, partie_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(
            select(Livre).where(Livre.part_id == part_id, Livre.partie_id == partie_id)
        )
        livres = result.scalars().all()
        if not livres:
            raise HTTPException(status_code=404, detail="Livres not found")
        return livres
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/articles/", dependencies=[Depends(get_api_key)])
async def get_articles(db_name: str, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Article))
        articles = result.scalars().all()
        if not articles:
            raise HTTPException(status_code=404, detail="Articles not found")
        return articles
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/articles/{article_id}", dependencies=[Depends(get_api_key)])
async def get_article(db_name: str, article_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Article).where(Article.id == article_id))
        article = result.scalars().first()
        if not article:
            raise HTTPException(status_code=404, detail="Article not found")
        return article
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/livres/", dependencies=[Depends(get_api_key)])
async def get_livres(db_name: str, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Livre))
        livres = result.scalars().all()
        if not livres:
            raise HTTPException(status_code=404, detail="Livres not found")
        return livres
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/livres/{livre_id}", dependencies=[Depends(get_api_key)])
async def get_livre(db_name: str, livre_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Livre).where(Livre.id == livre_id))
        livre = result.scalars().first()
        if not livre:
            raise HTTPException(status_code=404, detail="Livre not found")
        return livre
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/sections/", dependencies=[Depends(get_api_key)])
async def get_sections(db_name: str, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Section))
        sections = result.scalars().all()
        if not sections:
            raise HTTPException(status_code=404, detail="Sections not found")
        return sections
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/sections/{section_id}", dependencies=[Depends(get_api_key)])
async def get_section(db_name: str, section_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Section).where(Section.id == section_id))
        section = result.scalars().first()
        if not section:
            raise HTTPException(status_code=404, detail="Section not found")
        return section
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/sous-sections/", dependencies=[Depends(get_api_key)])
async def get_soussections(db_name: str, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(SousSection))
        soussections = result.scalars().all()
        if not soussections:
            raise HTTPException(status_code=404, detail="Sous-Sections not found")
        return soussections
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/sous-sections/{soussection_id}", dependencies=[Depends(get_api_key)])
async def get_soussection(db_name: str, soussection_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(SousSection).where(SousSection.id == soussection_id))
        soussection = result.scalars().first()
        if not soussection:
            raise HTTPException(status_code=404, detail="Sous-Section not found")
        return soussection
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/chapitres/", dependencies=[Depends(get_api_key)])
async def get_chapitres(db_name: str, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Chapitre))
        chapitres = result.scalars().all()
        if not chapitres:
            raise HTTPException(status_code=404, detail="Chapitres not found")
        return chapitres
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/{db_name}/chapitres/{chapitre_id}", dependencies=[Depends(get_api_key)])
async def get_chapitre(db_name: str, chapitre_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(select(Chapitre).where(Chapitre.id == chapitre_id))
        chapitre = result.scalars().first()
        if not chapitre:
            raise HTTPException(status_code=404, detail="Chapitre not found")
        return chapitre
    except SQLAlchemyError as e:
        raise HTTPException(status_code=500, detail=str(e))