from functools import lru_cache

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """
    Settings for the application.
    """

    python_env: str | None = "production"
    pvquery_domain: str
    pvquery_sentry_dsn: str | None = None

    model_config: SettingsConfigDict = SettingsConfigDict(env_file=".env")


@lru_cache
def get_settings():
    return Settings()


settings = get_settings()
