FROM python:3.10-slim

# Install system dependencies for OCR & PDF
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy ALL files (simple & safe)
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Expose Render port
EXPOSE 10000

# Start app
CMD ["python", "server.py"]
