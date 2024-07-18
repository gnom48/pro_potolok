FROM devries/bottle

COPY requirements.txt requirements.txt

EXPOSE 5555

ADD . /app
WORKDIR /app

CMD ["gunicorn","-b","0.0.0.0:5555","-w","3","--log-file","-","--log-level","debug","--access-logfile","-","app:app"]