from fastapi import FastAPI, HTTPException, Depends
from sqlalchemy.orm import Session
from . import models, schemas  # Assurez-vous d'importer les schémas et modèles corrects
from .database import SessionLocal, engine

app = FastAPI()

# Dépendance pour obtenir la session de la base de données
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/contacts/", response_model=schemas.ContactResponse)
def create_contact(contact: schemas.ContactCreate, db: Session = Depends(get_db)):
    db_contact = models.Contact(
        name=contact.name,
        firstname=contact.firstname,  # Assurez-vous de définir ce champ
        email=contact.email,
        message=contact.message
    )
    db.add(db_contact)
    db.commit()
    db.refresh(db_contact)
    return db_contact


# uvicorn API.main:app --reload