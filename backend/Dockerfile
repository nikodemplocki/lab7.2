FROM python:3.8-slim
WORKDIR /app
COPY ./app /app
RUN pip install flask
RUN apt-get update && \
    apt-get install -y iputils-ping && \
    rm -rf /var/lib/apt/lists/*
ENV FLASK_APP=main.py
CMD ["flask", "run", "--host=0.0.0.0"]
