from sqlalchemy.orm import DeclarativeBase


class Base(DeclarativeBase):
    """Import all models here so Alembic autogenerate sees them."""
