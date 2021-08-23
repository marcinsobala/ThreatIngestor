# syntax=docker/dockerfile:1 

FROM python:3.8-slim-buster 

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends nano

ADD . /opt/threatingestor
WORKDIR /opt/threatingestor

RUN pip3 install threatingestor[all] && \
    pip3 uninstall -y threatingestor && \
    pip3 install -r requirements.txt

COPY . .
