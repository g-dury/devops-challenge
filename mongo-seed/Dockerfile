FROM mongo

COPY ./record.json /record.json
CMD mongoimport --host $MONGO_HOST --db vigilant --username $MONGO_NON_ROOT_USERNAME --password $MONGO_NON_ROOT_PASSWORD --collection record --type json --file /record.json
