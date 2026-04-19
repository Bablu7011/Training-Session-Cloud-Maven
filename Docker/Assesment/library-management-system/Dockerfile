# -------- Stage 1 --------
FROM python:3.9-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# -------- Stage 2 --------
FROM python:3.9-slim

WORKDIR /app

# Copy installed packages (GLOBAL site-packages)
COPY --from=builder /usr/local/lib/python3.9 /usr/local/lib/python3.9

# Copy app code
COPY . .

# Create non-root user
RUN useradd -m appuser

USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
