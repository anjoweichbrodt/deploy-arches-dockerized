FROM python:3.8

ENV PYTHONUNBUFFERED=1 
ENV PYTHONDONTWRITEBYTECODE 1
ENV ARCHES_PATH=/home/app/arches

RUN mkdir -p $ARCHES_PATH

WORKDIR $ARCHES_PATH

RUN apt-get update
RUN apt-get install -y libgdal-dev
RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal
RUN export C_INCLUDE_PATH=/usr/include/gdal

RUN pip install --upgrade pip
RUN pip install GDAL==2.4.0
COPY . $ARCHES_PATH
RUN pip install -r requirements.txt

