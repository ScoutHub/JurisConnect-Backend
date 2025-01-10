from sqlalchemy import Column, Integer, Text, ForeignKey, UniqueConstraint
from sqlalchemy.orm import relationship
from database import Base

class Part(Base):
    __tablename__ = "parts"
    id = Column(Integer, primary_key=True, index=True)
    title = Column(Text, unique=True, nullable=False)

    parties = relationship("Partie", back_populates="part")


class Partie(Base):
    __tablename__ = "parties"
    id = Column(Integer, primary_key=True, index=True)
    part_id = Column(Integer, ForeignKey("parts.id", ondelete="CASCADE"))
    title = Column(Text, nullable=False)

    part = relationship("Part", back_populates="parties")
    livres = relationship("Livre", back_populates="partie")

    __table_args__ = (UniqueConstraint("title", "part_id"),)


class Livre(Base):
    __tablename__ = "livres"
    id = Column(Integer, primary_key=True, index=True)
    part_id = Column(Integer, ForeignKey("parts.id", ondelete="CASCADE"))
    partie_id = Column(Integer, ForeignKey("parties.id", ondelete="CASCADE"))
    title = Column(Text, nullable=False)

    partie = relationship("Partie", back_populates="livres")
    titres = relationship("Titre", back_populates="livre")

    __table_args__ = (UniqueConstraint("title", "part_id", "partie_id"),)


class Titre(Base):
    __tablename__ = "titres"
    id = Column(Integer, primary_key=True, index=True)
    part_id = Column(Integer, ForeignKey("parts.id", ondelete="CASCADE"))
    partie_id = Column(Integer, ForeignKey("parties.id", ondelete="CASCADE"))
    livre_id = Column(Integer, ForeignKey("livres.id", ondelete="CASCADE"))
    title = Column(Text, nullable=False)

    livre = relationship("Livre", back_populates="titres")
    chapitres = relationship("Chapitre", back_populates="titre")

    __table_args__ = (UniqueConstraint("title", "part_id", "partie_id", "livre_id"),)


class Chapitre(Base):
    __tablename__ = "chapitres"
    id = Column(Integer, primary_key=True, index=True)
    part_id = Column(Integer, ForeignKey("parts.id", ondelete="CASCADE"))
    partie_id = Column(Integer, ForeignKey("parties.id", ondelete="CASCADE"))
    livre_id = Column(Integer, ForeignKey("livres.id", ondelete="CASCADE"))
    titre_id = Column(Integer, ForeignKey("titres.id", ondelete="CASCADE"))
    title = Column(Text, nullable=False)

    titre = relationship("Titre", back_populates="chapitres")
    sections = relationship("Section", back_populates="chapitre")

    __table_args__ = (UniqueConstraint("title", "part_id", "partie_id", "livre_id", "titre_id"),)


class Section(Base):
    __tablename__ = "sections"
    id = Column(Integer, primary_key=True, index=True)
    part_id = Column(Integer, ForeignKey("parts.id", ondelete="CASCADE"))
    partie_id = Column(Integer, ForeignKey("parties.id", ondelete="CASCADE"))
    livre_id = Column(Integer, ForeignKey("livres.id", ondelete="CASCADE"))
    titre_id = Column(Integer, ForeignKey("titres.id", ondelete="CASCADE"))
    chapitre_id = Column(Integer, ForeignKey("chapitres.id", ondelete="CASCADE"))
    title = Column(Text, nullable=False)

    chapitre = relationship("Chapitre", back_populates="sections")
    sous_sections = relationship("SousSection", back_populates="section")

    __table_args__ = (
        UniqueConstraint("title", "part_id", "partie_id", "livre_id", "titre_id", "chapitre_id"),
    )


class SousSection(Base):
    __tablename__ = "sous_sections"
    id = Column(Integer, primary_key=True, index=True)
    part_id = Column(Integer, ForeignKey("parts.id", ondelete="CASCADE"))
    partie_id = Column(Integer, ForeignKey("parties.id", ondelete="CASCADE"))
    livre_id = Column(Integer, ForeignKey("livres.id", ondelete="CASCADE"))
    titre_id = Column(Integer, ForeignKey("titres.id", ondelete="CASCADE"))
    chapitre_id = Column(Integer, ForeignKey("chapitres.id", ondelete="CASCADE"))
    section_id = Column(Integer, ForeignKey("sections.id", ondelete="CASCADE"))
    title = Column(Text, nullable=False)

    section = relationship("Section", back_populates="sous_sections")
    articles = relationship("Article", back_populates="sous_section")

    __table_args__ = (
        UniqueConstraint(
            "title", "part_id", "partie_id", "livre_id", "titre_id", "chapitre_id", "section_id"
        ),
    )


class Article(Base):
    __tablename__ = "articles"
    id = Column(Integer, primary_key=True, index=True)
    part_id = Column(Integer, ForeignKey("parts.id", ondelete="CASCADE"))
    partie_id = Column(Integer, ForeignKey("parties.id", ondelete="CASCADE"))
    livre_id = Column(Integer, ForeignKey("livres.id", ondelete="CASCADE"))
    titre_id = Column(Integer, ForeignKey("titres.id", ondelete="CASCADE"))
    chapitre_id = Column(Integer, ForeignKey("chapitres.id", ondelete="CASCADE"))
    section_id = Column(Integer, ForeignKey("sections.id", ondelete="CASCADE"))
    sous_section_id = Column(Integer, ForeignKey("sous_sections.id", ondelete="CASCADE"))
    title = Column(Text, nullable=False)
    content = Column(Text, nullable=False)

    sous_section = relationship("SousSection", back_populates="articles")

    __table_args__ = (
        UniqueConstraint(
            "title",
            "part_id",
            "partie_id",
            "livre_id",
            "titre_id",
            "chapitre_id",
            "section_id",
            "sous_section_id",
        ),
    )
