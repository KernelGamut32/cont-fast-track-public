from flask import render_template
from app import app

@app.route('/')
def home():
    return "<b>Changed it back!</b>"

@app.route('/template')
def template():
    return render_template('home.html')

@app.route('/me-again')
def me_again():
    return render_template('me-again.html')