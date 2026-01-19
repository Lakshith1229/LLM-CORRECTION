# OCR & Translation Service

A professional, containerized OCR (Optical Character Recognition) application with LLM-based correction and translation capabilities. Supports Image, PDF, and DOCX formats.

## Features

-   **Multi-format Support**: Extracts text from Images, PDFs (both text-based and scanned), and DOCX files.
-   **LLM Correction**: Uses Llama 3 (via Groq) to correct OCR errors and improve text quality.
-   **Translation**: Offline English-to-Hindi translation and Hindi-to-Kannada transliteration.
-   **Multiple Output Formats**: Download extracted text as TXT, PDF, or DOCX.
-   **Containerized**: Docker support for easy deployment.

## Project Structure

```
ocr-project/
├── src/
│   ├── app.py              # Main Flask application
│   ├── config.py           # Configuration management
│   ├── services/
│   │   ├── ocr_service.py      # Text extraction logic
│   │   ├── llm_service.py      # LLM correction logic
│   │   └── translate_service.py # Translation logic
│   └── utils/
│       └── logger.py           # Logging setup
├── static/                 # Static assets (CSS, JS)
├── templates/              # HTML templates
├── tests/                  # Unit and integration tests
├── Dockerfile              # Docker build instructions
├── docker-compose.yml      # Docker Compose setup
└── requirements.txt        # Python dependencies
```

## Prerequisites

-   Python 3.10+
-   [Tesseract OCR](https://github.com/tesseract-ocr/tesseract)
-   [Poppler](https://poppler.freedesktop.org/) (for PDF processing)
-   [Groq API Key](https://console.groq.com/) (for LLM correction)

## Local Setup

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd ocr-project
    ```

2.  **Create a virtual environment:**
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows: venv\Scripts\activate
    ```

3.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

4.  **Set up environment variables:**
    Create a `.env` file in the root directory:
    ```env
    GROQ_API_KEY=your_groq_api_key_here
    UPLOAD_FOLDER=uploads
    ```

5.  **Run the application:**
    ```bash
    python src/app.py
    ```
    Access the app at `http://localhost:5000`.

## Docker Setup

1.  **Build and run with Docker Compose:**
    ```bash
    docker-compose up --build
    ```
    The application will be available at `http://localhost:5000`.

## Testing

Run the test suite using `pytest`:
```bash
pytest tests/
```

## License

MIT
