import os

class Config:
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL', 'postgresql://postgres:Danil5215@localhost/postgres')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
