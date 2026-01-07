FROM python:3.11-slim

# OCR system dependencies
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    poppler-utils \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements from repo root
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy MCP server code
COPY mcp/server.py ./server.py

# MCP runs via stdio
CMD ["python", "server.py"]
