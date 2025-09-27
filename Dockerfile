FROM python:3.9-slim

WORKDIR /app

COPY app.py .

RUN pip install flask

EXPOSE 5000

ENV APP_MESSAGE="Hello from Docker!"

CMD ["python", "app.py"]