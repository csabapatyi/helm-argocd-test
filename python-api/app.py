import flask
from flask import request, jsonify
from markupsafe import escape


app = flask.Flask(__name__)
app.config["DEBUG"] = True

error_message = {'error': 'You must request an integer between 1 and 100 or /ready '}

@app.route('/<int:given_value>', methods=['GET'])
def home(given_value):
    generated_string = ''

    if (100 > given_value < 1) or (given_value > 100):
        return jsonify(error_message)

    # Checking the division rules
    if given_value % 3 == 0:
        generated_string += 'Foo'
    if given_value % 5 == 0:
        generated_string += 'Bar'
    if given_value % 7 == 0:
        generated_string += 'Qix'

    # Checking the containment rules
    input_converted_to_string = str(given_value)

    for current_number in input_converted_to_string:
        if current_number == '3':
            generated_string += 'Foo'
        if current_number == '5':
            generated_string += 'Bar'
        if current_number == '7':
            generated_string += 'Qix'

    # Checking if the generated_string is still empty
    if generated_string == '':
        generated_string = given_value

    generated_dict = {'result':generated_string}
    return jsonify(generated_dict)


@app.route('/ready', methods=['GET'])
def healthcheck():
    health_result = {'status': 'ok'}
    return jsonify(health_result)

@app.errorhandler(404)
def page_not_found(error):
    return jsonify(error_message)

app.run()
