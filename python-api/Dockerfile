# Dockerfile based on this site: https://runnable.com/docker/python/dockerize-your-flask-application
FROM python:3.6-alpine

LABEL maintainer="csaba@cloudsolutionarchitect.net"

RUN mkdir -p /app/

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY app.py /app

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]