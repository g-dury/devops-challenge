import os

from flask import Flask, jsonify
from flask_pymongo import PyMongo

from backends.mongo import find_records, MongoJSONEncoder, ObjectIdConverter

app = Flask(__name__)
app.config['MONGO_URI'] = os.environ.get('MONGO_URI')
app.json_encoder = MongoJSONEncoder
app.url_map.converters['objectid'] = ObjectIdConverter

mongo = PyMongo(app)


@app.route('/api/v1/records')
def records():
    return jsonify(find_records(mongo))


@app.route('/api/v1/records/<id>')
def record(id):
    record=find_records(mongo, id)
    if len(record) == 0:
        return ('',204)
    else:
        return jsonify(record[0])


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=False, port=8080)
