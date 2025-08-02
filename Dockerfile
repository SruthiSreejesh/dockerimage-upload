FROM python:3.11-alpine

RUN mkdir /var/flaskapp

RUN  adduser -h /var/flaskapp -s /bin/sh -D -H flaskuser

WORKDIR /var/flaskapp

COPY ./code/ .

RUN pip install -r requirements.txt

RUN chown -R flaskuser:flaskuser /var/flaskapp

EXPOSE 8080

USER flaskuser

ENTRYPOINT ["python" ] 

CMD ["app.py"]
