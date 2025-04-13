FROM python:3.13-slim-bullseye@sha256:0d46ec7010093c2a30ae712c3d6fc9d3938ae8d31dcf38c14deee3e43f88e6ca

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest@sha256:3362a526af7eca2fcd8604e6a07e873fb6e4286d8837cb753503558ce1213664 /uv /bin/uv

# Copy the application into the container
COPY . /app

# Install the application dependencies
WORKDIR /app

# Create a virtual environment first and then install the package
RUN uv venv
RUN . .venv/bin/activate && uv pip install --no-cache .

# Run the application
CMD ["/app/.venv/bin/uvicorn", "pvquery.main:app", "--host", "0.0.0.0", "--port", "8000"]
