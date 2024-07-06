from pydantic import BaseModel

class ContactCreate(BaseModel):
    name: str
    firstname: str  # Ajoutez ce champ
    email: str
    message: str

class ContactResponse(BaseModel):
    id: int
    name: str
    firstname: str  # Ajoutez ce champ
    email: str
    message: str
    created_at: str

    class Config:
        orm_mode = True
