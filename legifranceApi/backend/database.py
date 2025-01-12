import os
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine

Base = declarative_base()

def get_database_url(db_name: str) -> str:
    db_user = os.getenv("DB_USER")
    db_password = os.getenv("DB_PASSWORD")
    db_host = os.getenv("DB_HOST")
    db_port = os.getenv("DB_PORT")
    return f'postgresql+asyncpg://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}'

def create_session(db_name: str):
    database_url = get_database_url(db_name)
    engine = create_async_engine(database_url, echo=True)
    async_session = sessionmaker(
        engine, expire_on_commit=False, class_=AsyncSession
    )
    return async_session

async def get_db(db_name: str):
    async_session = create_session(db_name)
    async with async_session() as session:
        yield session
