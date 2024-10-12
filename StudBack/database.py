import os
from sqlalchemy.orm import create_session, sessionmaker
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base

# SQLALCHEMY_DATABASE_URL = "sqlite:///./DB.db"

# SQLALCHEMY_DATABASE_URL = "sqlite:///./MySiteDB.db"

SQLALCHEMY_DATABASE_URL = "postgresql://admin:admin@db:5432/admin"

engine = create_engine(
    SQLALCHEMY_DATABASE_URL
)
#
# SQLALCHEMY_DATABASE_URL = "sqlite:///./MySiteDB.db"
# engine = create_engine(
#     SQLALCHEMY_DATABASE_URL, connect_args={"check_same_thread": False}
# )


session = sessionmaker(bind=engine, expire_on_commit=False)

Base = declarative_base()
