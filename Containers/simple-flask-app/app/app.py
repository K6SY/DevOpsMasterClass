from flask import Flask
from flask import request
from flask import redirect
from flask import render_template
from werkzeug.exceptions import HTTPException



app = Flask(__name__)
    

@app.route('/', methods=['GET'])
def HomePage():
    return render_template("app/index.html")

@app.route('/programmes', methods=['GET'])
def ProgrammePage():
    return render_template("app/programme.html")

@app.route('/about', methods=['GET'])
def AboutPage():
    return render_template("app/about.html")

'''
@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template('error/404.html'), 404

@app.errorhandler(500)
def error_server(e):
    # note that we set the 404 status explicitly
    return render_template('error/404.html'), 500

'''