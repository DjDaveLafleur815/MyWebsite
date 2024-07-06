FROM python:latest

RUN mkdir -p /app

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install --upgrade pip

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY . /app/

EXPOSE 8081

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8081", "--proxy-headers"]

# sudo docker build -t api . && sudo docker run --rm -p 8081:8081 api
