from flask import Flask, request, make_response, jsonify
from helpers.dbhelpers import run_statement
from dbcreds import production_mode
from app import app
import bcrypt
from uuid import uuid4


@app.post('/api/user')
def signup():
    first_name = request.json.get("firstName")
    last_name = request.json.get("lastName")
    username = request.json.get("userName")
    email = request.json.get("email")
    password = request.json.get("password")
    salt = bcrypt.gensalt()
    hash_result = bcrypt.hashpw(password.encode(), salt)
    result = run_statement("CALL signup(?,?,?,?,?)", [first_name, last_name, username, email, hash_result])
    if result == None:
        return make_response(jsonify("Signed up successfully"), 200)
    else:
        return make_response(jsonify(result), 500)
    


@app.post('/api/user-login')
def login():
    """
    1. get the user_id and password when the user enters the username
    2. if result is empty, tell the user to enter a valid username
    3. if the result is == list then user_id should == first element of the list and pass == second elementof the list
    4. convert password string into bytes
    5. create a userInput .json
    6. compare the two(userInputPass and hashed_pass)
    7. generate a token with username value in the beginning of the token
    8. call log_in procedure that takes generated token value and user id
    """
    username = request.json.get("username")
    result = run_statement("CALL get_pass(?)", [username])
    if (result == []):
        return "Please enter a valid username"
    if(type(result) == list):
        user_id = result [0][0]
        hashed_pass = result[0][1].encode()
    userInput_pass = request.json.get("password").encode()
    if (bcrypt.checkpw(userInput_pass, hashed_pass)):
        token = uuid4().hex
        new_token = username + token
        response = run_statement("CALL user_login(?,?)", [new_token, user_id])
        if response == None:
            return make_response(jsonify("Logged in successfully"), 200)
    else:
        return make_response(jsonify("Error"), 400)






















@app.get('/api/user-login')
def get_user():
    token = request.headers.get("token")
    get_user = run_statement("CALL get_user()")
    keys = ["id","firstName", "lastName", "username", "email", "created_at"]
    result = []
    if(type(get_user) == list):
        if token == None:
            return "You must enter a valid user token"
        for user in get_user:
            zipped = zip(keys, user)
            result.append(dict(zipped))
        return make_response(jsonify(result), 200)
        # 200 code is good to get a get request
    else:
        return make_response(jsonify(result), 500)


