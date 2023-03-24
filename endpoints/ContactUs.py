from flask import request, make_response, jsonify
from helpers.dbhelpers import run_statement,execute_statement
from app import app

@app.post('/api/contact-us')
def contact():
    name = request.json.get("name")
    email = request.json.get("email")
    msg = request.json.get("msg")
    rate = request.json.get("rate")
    result = run_statement("CALL contact_us(?,?,?,?)", [name, email,msg,rate])
    if result == None:
        return make_response(jsonify("Submitted"), 200)
    else:
        return make_response(jsonify("Error"), 500)
