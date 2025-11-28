FROM python:3.11-slim-bullseye

WORKDIR /app

RUN apt-get update && \
    apt-get install -y tesseract-ocr libtesseract-dev git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy local project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir pytesseract

EXPOSE 8080

CMD ["python", "run.py"]
