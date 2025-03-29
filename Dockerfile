FROM python:3.13-slim-bullseye@sha256:c527a33e5265d0f830994d1b3237d38840a7b7986a8b9374a4b941ac34048190

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest@sha256:57da96c4557243fc0a732817854084e81af9393f64dc7d172f39c16465b5e2ba /uv /bin/uv

# Copy the application into the container
COPY . /app

# Install the application dependencies
WORKDIR /app

# Create a virtual environment first and then install the package
RUN uv venv
RUN . .venv/bin/activate && uv pip install --no-cache .

# Run the application
CMD ["/app/.venv/bin/uvicorn", "pvquery.main:app", "--host", "0.0.0.0", "--port", "8000"]
