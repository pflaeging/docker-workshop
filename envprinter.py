
from flask import Flask
from datetime import datetime
import os

app = Flask(__name__)

@app.route("/")
def envprinter():
    # make HTML
    html = "<html><title>EnvPrinter</title><body>"
    # header with date
    html += "<h2> Environment:</h2>"
    # Environment in PRE 
    html += "<pre>"
    for param in os.environ.keys():
        html += "\n" + "%20s %s" % (param,os.environ[param])
    html += "</pre>"
    #
    # print date
    html += "<hr/>"
    now = datetime.now()
    html += now.strftime("%c")
    # end HTML
    html += "</body></html>"        
    return html
