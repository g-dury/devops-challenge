FROM python:3.7.5-alpine

RUN apk --update add bash nano
COPY ./requirements.txt /var/www/requirements.txt
RUN pip install -r /var/www/requirements.txt

COPY . /var/www/

ENTRYPOINT ["python"]

CMD ["/var/www/app.py"]
