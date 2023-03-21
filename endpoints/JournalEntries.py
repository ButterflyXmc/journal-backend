from flask import Flask, request, make_response, jsonify
from helpers.dbhelpers import run_statement
from helpers.apihelper import check_info
from dbcreds import production_mode
from app import app

@app.get('/api/journal')
def get_entries():
    token = request.headers.get("token")
    get_journal = run_statement("CALL get_user_entries(?)", [token])
    keys = ["grateful1","grateful2","grateful3",
            "great1","great2","affirm1", "affirm2",
            "highlights1","highlights2","learn1",
            "learn2","created_at"]
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
        return make_response(jsonify("ERROR"), 500)


# !WORKS!!!!!!!!
@app.post('/api/journal')
def add_entries():
    token = request.headers.get("token")
    grtful1 = request.json.get("grtf1")
    grtful2 = request.json.get("grtf2")
    grtful3 = request.json.get("grtf3")
    grt1 = request.json.get("grt1")
    grt2 = request.json.get("grt2")
    af1 = request.json.get("af1")
    af2 = request.json.get("af2")
    h1 = request.json.get("h1")
    h2 = request.json.get("h2")
    l1 = request.json.get("l1")
    l2 = request.json.get("l2")
    result = run_statement("CALL new_entry(?,?,?,?,?,?,?,?,?,?,?,?)",[token, grtful1, grtful2, grtful3, grt1, grt2, af1, af2, h1, h2, l1, l2])
    if result == None:
        return make_response(jsonify("Entry created!"), 200)
    else:
        return make_response(jsonify("Error"), 500)


















# required_data = ['token', 'text']
    # check_result = check_info(request.json, required_data)
    # if check_result != None:
    #     return check_result