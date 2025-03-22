# pvquery

**NOTE:** This project is still under development. Expect breaking changes!

A small photovoltaic (PV) microservice.

## Development

### Setup

Install the following external dependencies:

- [uv](https://docs.astral.sh/uv/getting-started/installation/)

### Running the application

```bash
# Create the virtual environment
make

# Activate the virtual environment
source .venv/bin/activate

# Install the dependencies
uv sync --all-packages

# Run the application in development mode
make dev
```
