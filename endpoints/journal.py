from flask import Flask, request, make_response, jsonify
from helpers.dbhelpers import run_statement
from helpers.apihelper import check_info
from dbcreds import production_mode
from app import app

@app.get('/api/journal')
def see_entries():
    token = request.args.get("token")
    get_journal = run_statement("CALL get_journal(?)", [token])
    keys = ["id","text","created_at"]
    result = []
    if(type(get_journal) == list):
        if token == None:
            return "You must enter a valid user token"
        for entry in get_journal:
            zipped = zip(keys, entry)
            result.append(dict(zipped))
        return make_response(jsonify(result), 200)
        # 200 code is good to get a get request
    else:
        return make_response(jsonify(result), 500)


@app.post('/api/journal')
def add_entries():
    token = request.args.get("token")
    get_token = run_statement("CALL get_token(?)")


















# required_data = ['token', 'text']
    # check_result = check_info(request.json, required_data)
    # if check_result != None:
    #     return check_result