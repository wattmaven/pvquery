import sentry_sdk
from fastapi import FastAPI

from pvquery.settings import settings

sentry_sdk.init(
    dsn=settings.pvquery_sentry_dsn,
    # Add data like request headers and IP for users,
    # see https://docs.sentry.io/platforms/python/data-management/data-collected/ for more info
    send_default_pii=False,
)

app = FastAPI()


@app.get("/")
async def root():
    return {"status": "ok"}
