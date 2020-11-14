FROM python:3.6

LABEL maintainer="thanhnb@nhanhoa.com.vn"

# create directory for the app user
RUN groupadd web
RUN useradd web -g web

# create directory

ENV HOME=/home/web
ENV APP_HOME=/home/web/api

RUN mkdir -p $HOME
RUN mkdir -p $APP_HOME
RUN mkdir -p /var/log/web
RUN mkdir -p /home/web/log

RUN mkdir -p $APP_HOME/static
RUN mkdir -p $APP_HOME/project/static

# copy requirement
COPY requirements.txt $HOME

# install python requirement
RUN pip install --upgrade pip
RUN pip install -r $HOME/requirements.txt

# change workdir
WORKDIR $APP_HOME

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# copy project
COPY . $APP_HOME

# copy setup script
COPY ./setup-prod.sh $HOME/setup-prod.sh
RUN chmod +x $HOME/setup-prod.sh

# chown all the files to the web user
RUN chown -R web:web $HOME
RUN chown -R web:web /home/web/log

# change to the app user
USER web

ENTRYPOINT ["bash", "-x", "/home/web/setup-prod.sh"]
