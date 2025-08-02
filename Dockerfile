FROM python:3.11-alpine

ENV APP_USER flaskuser

ENV APP_DIRECTORY /var/flaskapp

RUN mkdir $APP_DIRECTORY

RUN  adduser -h $APP_DIRECTORY -s /bin/sh -D -H $APP_USER

WORKDIR $APP_DIRECTORY

COPY ./code/flaskapp-code.tar  .

RUN tar -xvf flaskapp-code.tar 

RUN pip install -r requirements.txt

RUN chown -R $APP_USER:$APP_USER $APP_DIRECTORY

EXPOSE 8080

USER flaskuser

ENTRYPOINT ["python" ] 

CMD ["app.py"]
