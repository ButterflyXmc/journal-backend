from flask import Flask, request, make_response, jsonify
from helpers.dbhelpers import run_statement
from helpers.apihelper import check_info
from dbcreds import production_mode
from app import app
from datetime import datetime

@app.get('/api/journal')
def get_entries():
    token = request.headers.get("token")
    get_journal = run_statement("CALL get_user_entries(?)", [token])
    keys = ["entryId","grateful1","grateful2","grateful3",
            "great1","great2","affirm1", "affirm2",
            "created_at"]
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
    

@app.get('/api/pm-journal')
def get_pm_entries():
    token = request.headers.get("token")
    get_journal = run_statement("CALL get_pm_entries(?)", [token])
    keys = ["entryIdd","highlights1","highlights2","learn1",
            "learn2","created_att"]
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



@app.post('/api/am-journal')
def add_entries():
    token = request.headers.get("token")
    grtful1 = request.json.get("grtf1")
    grtful2 = request.json.get("grtf2")
    grtful3 = request.json.get("grtf3")
    grt1 = request.json.get("grt1")
    grt2 = request.json.get("grt2")
    af1 = request.json.get("af1")
    af2 = request.json.get("af2")
    result = run_statement("CALL new_entry(?,?,?,?,?,?,?,?)",[token, grtful1, grtful2, grtful3, grt1, grt2, af1, af2])
    if result == None:
        return make_response(jsonify("Entry created!"), 200)
    else:
        return make_response(jsonify("Error"), 500)
    

@app.post('/api/pm-journal')
def add_pm_entries():
    token = request.headers.get("token")
    highlights1 = request.json.get("highlights1")
    highlights2 = request.json.get("highlights2")
    learn1 = request.json.get("learn1")
    learn2 = request.json.get("learn2")
    result = run_statement("CALL pm_entry(?,?,?,?,?)", [token, highlights1, highlights2,learn1, learn2])
    if result == None:
        return make_response(jsonify("Entry created!"), 200)
    else:
        return make_response(jsonify("Error"), 500)






@app.delete('/api/journal')
def delete_entry():
    token = request.headers.get("token")
    entry_id = request.json.get("entryID")
    if not token:
        return make_response(jsonify("Token is missing or invalid"), 400)
    if not entry_id:
        return make_response(jsonify( "Entry ID is missing or invalid"), 400)
    result = run_statement("CALL delete_entries(?,?)", [entry_id ,token])
    if result == None:
        return make_response(jsonify("Entry deleted!"), 200)
    else:
        return make_response(jsonify("Failed to delete entry"), 500)

@app.patch('/api/journal')
def patch_entry():
    token = request.headers.get("token")
    entryId = request.json.get("entryId")
    grateful1 = request.json.get("grateful1")
    grateful2 = request.json.get("grateful2")
    grateful3 = request.json.get("grateful3")
    great1 = request.json.get("great1")
    great2 = request.json.get("great2")
    affirm1 = request.json.get("affirm1")
    affirm2 = request.json.get("affirm2")
    highlights1 = request.json.get("highlights1")
    highlights2 = request.json.get("highlights2")
    learn1 = request.json.get("learn1")
    learn2 = request.json.get("learn2")
    result = run_statement("CALL edit_user_entries(?,?,?,?,?,?,?,?,?,?,?,?,?)",
                            [token, entryId, grateful1,grateful2,grateful3,great1,great2,
                            affirm1,affirm2,highlights1,highlights2,learn1,learn2])
    if result is None:
        return make_response(jsonify("Entry updated!"), 200)
    else:
        return make_response(jsonify("Failed to Update entry"), 500)
    

# !trying calander view
# from datetime import datetime

# @app.get('/api/journal/entry/<string:date>')
# def get_entry(date):
#     token = request.headers.get("token")
#     get_entry = run_statement("CALL calander_view(?,?)", [token, date])
#     keys = ["entryId","grateful1","grateful2","grateful3",
#             "great1","great2","affirm1", "affirm2",
#             "highlights1","highlights2","learn1",
#             "learn2","created_at"]
#     if(type(get_entry) == list and len(get_entry) > 0):
#         zipped = zip(keys, get_entry[0])
#         result = dict(zipped)
#         # format the date in yyyy-mm-dd
#         result['created_at'] = datetime.strptime(result['created_at'], '%Y-%m-%d %H:%M:%S').strftime('%Y-%m-%d')
#         return make_response(jsonify(result), 200)
#         # 200 code is good to get a get request
#     else:
#         return make_response(jsonify("Entry not found"), 404)
#         # 404 code is good to get a resource not found request






