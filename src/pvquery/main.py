import sentry_sdk
from fastapi import FastAPI

from pvquery.settings import settings

sentry_sdk.init(
    dsn=settings.pvquery_sentry_dsn,
    # Add data like request headers and IP for users,
    # see https://docs.sentry.io/platforms/python/data-management/data-collected/ for more info
    send_default_pii=False,
)

app = FastAPI(
    title="PVQuery API",
    description="A small photovoltaic (PV) microservice.",
    version="0.1.0",
    servers=[
        server
        for server in [
            {"url": "http://localhost:8000", "description": "Local"}
            # If the python environment is not production, add the local server.
            if settings.python_env != "production"
            else None,
            {
                "url": f"https://{settings.pvquery_domain}",
                "description": "Production",
            },
        ]
        if server is not None
    ],
    license_info={
        "name": "Apache 2.0",
        "identifier": "Apache-2.0",
        "url": "https://opensource.org/licenses/apache-2.0",
    },
    contact={
        "name": "WattMaven",
        "url": "https://www.wattmaven.com",
        "email": "info@wattmaven.com",
    },
)


@app.get("/")
async def root():
    return {"status": "ok"}
