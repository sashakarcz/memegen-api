# Use Python 3.13 base image
FROM python:3.13

# Set working directory
WORKDIR /app

# Install Poetry
RUN pip install --no-cache-dir poetry

# Copy the project files
COPY . .

# Install dependencies
RUN poetry config virtualenvs.create false && poetry install --no-root --no-interaction --no-ansi

# Expose the port used by Sanic
EXPOSE 5000

# Start the Sanic app (explicitly specifying the correct module)
CMD ["poetry", "run", "sanic", "app.main:app", "--host=0.0.0.0", "--port=5000"]
