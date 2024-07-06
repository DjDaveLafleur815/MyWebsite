from sqlalchemy import create_engine, Column, Integer, String, Text, TIMESTAMP, func
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "mysql+pymysql://root:root@localhost:3306/contacts"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

class Contact(Base):
    __tablename__ = "contacts"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(255), nullable=False)
    firstname = Column(String(255), nullable=False)  # Ajoutez ce champ
    email = Column(String(255), nullable=False)
    message = Column(Text, nullable=False)
    created_at = Column(TIMESTAMP, server_default=func.now())

Base.metadata.create_all(bind=engine)
