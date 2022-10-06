from typing import Type
import flask
import requests
from werkzeug.routing import BaseConverter

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/stat', methods=['GET'])
def get_stat():
    return "<h1>API Healthcheck</h1><p>If this page loads means that the api is doing well. </p><p>It`s just chilling and wait for an request </p>"


@app.route('/readiness', methods=['GET'])
def get_readiness():
    return "<h1>API Healthcheck</h1><p>The service respond to readiness </p>"

@app.route('/liveness', methods=['GET'])
def get_liveness():
    return "<h1>API Healthcheck</h1><p>The service respond to liveness </p>"



class RegexConverter(BaseConverter):
    def __init__(self, url_map, *items):
        super(RegexConverter, self).__init__(url_map)
        self.regex = items[0]


app.url_map.converters['regex'] = RegexConverter

@app.route('/<regex("[0-9]+"):randNum>/')
# def doc_randNum(randNum):
#     return "Document Number is: %s" % (randNum)"
def get_data(randNum):
    return requests.get('http://localhost:3000/').content, {'Content-Type': 'application/pdf; charset=utf-8'}

app.run(host="0.0.0.0")