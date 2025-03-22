FROM python:3.12-slim-bullseye@sha256:00ead89513b0a58e3805e7e88fc522a71ac6dec1b2efcf90b4e1b852cafcff74

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest@sha256:cbc016e49b55190e17bfd0b89a1fdc1a54e0a54a8f737dfacc72eca9ad078338 /uv /bin/uv

# Copy the application into the container
COPY . /app

# Install the application dependencies
WORKDIR /app

# Create a virtual environment first and then install the package
RUN uv venv
RUN . .venv/bin/activate && uv pip install --no-cache .

# Run the application
CMD ["/app/.venv/bin/uvicorn", "pvquery.main:app", "--host", "0.0.0.0", "--port", "8000"]
