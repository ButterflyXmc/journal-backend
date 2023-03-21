from flask import request, make_response, jsonify
from helpers.dbhelpers import run_statement,execute_statement
from app import app
import bcrypt
from uuid import uuid4

#!NEED 
# ^ AN ERROR IF THE USERNAME AND OR PASSWORD DOESNT MATCH THE ONE IN RECORD


@app.get('/api/user')
def get_user():
    token = request.headers.get('token')
    # print(token)
    result = run_statement("CALL get_user_info(?)", [token])
    keys = ["firstname", "lastname", "username", "email","created_at"]
    response = []
    if(type(result) == list):
        for u in result:
            zipped = zip(keys,u)
            response.append(dict(zipped))
        return make_response(jsonify(response), 200)
    else:
        return make_response(jsonify("Error"), 500)
    
@app.patch('/api/user')
def update_user():
    token = request.headers.get('token')
    first_name_input = request.json.get('firstName')
    last_name_input = request.json.get('lastName')
    username_input = request.json.get('username')
    email_input = request.json.get('email')
    result = run_statement("CALL update_user_info(?,?,?,?,?)", [token, first_name_input, last_name_input,username_input,email_input])
    if (type(result)==list):
        return make_response(jsonify("Profile updated successfully!"), 200)
    else:
        return make_response(jsonify("Error"), 500)


@app.post('/api/user')
def signup():
    first_name = request.json.get("firstName")
    last_name = request.json.get("lastName")
    username = request.json.get("userName")
    email = request.json.get("email")
    password = request.json.get("password")
    if not password:
        return make_response(jsonify("Please enter a password"), 400)
    salt = bcrypt.gensalt()
    hash_result = bcrypt.hashpw(password.encode(), salt)
    result = run_statement("CALL user_signup(?,?,?,?,?)", [first_name, last_name, username, email, hash_result])
    if (result == []):
        return make_response(jsonify({"error": "Please fill out all the fields"}), 400)
    if isinstance(result, list) and result:
        token = uuid4().hex
        new_token = username + token
        user_id = result[0][0]
        run_statement("CALL user_login(?,?)", [new_token, user_id])
        return make_response(jsonify("Signed up successfully", new_token), 200)
    elif "user_UN_username" in result:
            return make_response(jsonify("This username is already taken, please choose a different username."), 409)
    elif "user_UN_email" in result:
        return make_response(jsonify("This email is already registered. Please login or choose a different email."),409)
    elif "user_CHECK_email_format" in result:
        return make_response(jsonify("Please enter a valid email"),409)
    else:
        return make_response(jsonify("something went wrong"), 500)
    

@app.delete('/api/user')
def delete_user():
    token = request.headers.get('token')
    result = run_statement("CALL delete_user(?)", [token])
    if result == None:
        return make_response(jsonify("Acct deleted!"), 200)
    else:
        return make_response(jsonify("Error"), 500)