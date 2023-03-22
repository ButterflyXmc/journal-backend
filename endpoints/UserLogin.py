from flask import request, make_response, jsonify
from helpers.dbhelpers import run_statement, execute_statement
from dbcreds import production_mode
from app import app
import bcrypt
from uuid import uuid4

@app.post('/api/user-login')
def login():
    username = request.json.get("username")
    result = run_statement("CALL get_pass(?)", [username])
    if (result == []):
        return "Please enter a valid username"
    if(type(result) == list):
        user_id = result [0][0]
        hashed_pass = result[0][1].encode()
        userInput_pass = request.json.get("password").encode()
        if(bcrypt.checkpw(userInput_pass, hashed_pass)):
            token = uuid4().hex
            new_token = username + token
            response = run_statement("CALL user_login(?,?)", [new_token, user_id])
            if response != None:
                return make_response(jsonify("Logged in successfully", new_token), 200)
        else:
            return make_response(jsonify("Invalid password"), 401)
    else:
        return make_response(jsonify("Error"), 400)
    
    # ^
    """
    1. call the procedure to get the user_id and password when the user enters the username
    2. if result is empty, tell the user to enter a valid username
    3. if the result is == list then user_id should == first element of the list and pass == second element of the list
    4. convert password string into bytes
    5. create a userInput .json
    6. compare the two(userInputPass and hashed_pass)
    7. generate a token with username value in the beginning of the token
    8. call log in procedure that takes generated token value and user id
    """

@app.delete('/api/user-login')
def user_logout():
    token = request.headers.get('token')
    result = run_statement("CALL user_logout(?)", [token])
    if result == None:
        return make_response(jsonify("Logged out!"), 200)
    else:
        return make_response(jsonify("Error"), 500)