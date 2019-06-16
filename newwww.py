from ariadne import QueryType, graphql_sync, make_executable_schema
from flask import Flask, request, jsonify
import DB as DB

type_defs = """
    type Query {
        user (id:ID): User
    }

    type User {
        USER_ID: ID
        FIRST_NAME: String
        LAST_NAME: String
        AGE: Int
        EMAIL: String!
        PHONE_NUMBER: String
        DATE_UPDATED: String

        USER_LATITUDE: Float
        USER_LONGITUDE: Float

        EXP_VALUE: Int

        BLOOD_PRESSURE: String
        HEART_RATE: Int
        BODY_TEMP: Int
        WEIGHT: Int
    }
"""

query = QueryType()

BaseStrings = ['SELECT',
'''FROM User_Data UD
LEFT JOIN User_Location UL ON UD.USER_ID = UL.USER_ID
LEFT JOIN User_Bio UB ON UD.USER_ID = UB.USER_ID
LEFT JOIN User_Usage_Data UU ON UD.USER_ID = UU.USER_ID
WHERE USER_ID = {id}''']

@query.field("user")
def resolve_name(_, info, id=None):
    #open up a db connection
    my_DB = DB.DB()
    conn = my_DB.connect_to_db()
    c = conn.cursor()
    #c.execute()
    #request = info.context
    # user_agent = request.headers.get("User-Agent", "Guest")
    # return "Hello, %s!" % user_agent

    my_DB.finish_db(conn)
    return id


schema = make_executable_schema(type_defs, query)


app = Flask(__name__)


@app.route("/graphql", methods=["POST"])
def graphql_server():
    # GraphQL queries are always sent as POST
    data = request.get_json()

    # Note: Passing the request to the context is optional.
    # In Flask, the current request is always accessible as flask.request
    success, result = graphql_sync(
        schema,
        data,
        context_value=request
    )
    print(result)
    status_code = 200 if success else 400
    return jsonify(result), status_code


if __name__ == "__main__":
    app.run(debug=True)
