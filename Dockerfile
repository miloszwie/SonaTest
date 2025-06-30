# Use a small base image
FROM python:3.11-slim

# Install dependencies
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy app source
COPY . .

# Expose port
EXPOSE 8080

# Healthcheck endpoint and start command
HEALTHCHECK CMD curl --fail http://localhost:8080/health || exit 1

CMD ["python", "main.py"]
