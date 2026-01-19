FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements first to leverage cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Download translation models
COPY scripts/download_models.py scripts/
RUN python scripts/download_models.py

# Copy application code
COPY src/ src/
COPY static/ static/
COPY templates/ templates/

# Set environment variables
ENV FLASK_APP=src/app.py
ENV PYTHONUNBUFFERED=1
ENV UPLOAD_FOLDER=/app/uploads

# Create upload directory
RUN mkdir -p /app/uploads

EXPOSE 5000

CMD ["python", "src/app.py"]
