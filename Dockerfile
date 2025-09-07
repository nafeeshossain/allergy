# Use a standard Python 3.11 base image from Debian
FROM python:3.11-slim-bullseye

# Set the working directory inside the container
WORKDIR /app

# Update package lists and install Tesseract-OCR
RUN apt-get update && apt-get install -y tesseract-ocr

# Copy and install Python requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code into the container
COPY . .

# Command to run your application using gunicorn
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:10000"]
