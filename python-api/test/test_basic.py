import json


def test_healthcheck(app, client):
    res = client.get('/ready')
    assert res.status_code == 200
    expected = {'status': 'ok'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_home_simple_numbers(app, client):
    # Testing simple numbers
    for i in [1, 2, 4, 8]:
        url_parameter = '/' + str(i)
        res = client.get(url_parameter)
        assert res.status_code == 200
        expected = {'result': i}
        assert expected == json.loads(res.get_data(as_text=True))

def test_home_with_special_number_3(app, client):
    # testing 3
    res = client.get('/3')
    assert res.status_code == 200
    expected = {'result': 'FooFoo'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_home_with_special_number_5(app, client):
    # testing 5
    res = client.get('/5')
    assert res.status_code == 200
    expected = {'result': 'BarBar'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_home_with_special_number_7(app, client):
    # testing 7
    res = client.get('/7')
    assert res.status_code == 200
    expected = {'result': 'QixQix'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_home_with_special_number_9(app, client):
    # testing 9
    res = client.get('/9')
    assert res.status_code == 200
    expected = {'result': 'Foo'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_home_with_special_number_10(app, client):
    # testing 10
    res = client.get('/10')
    assert res.status_code == 200
    expected = {'result': 'Bar'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_home_with_special_number_51(app, client):
    # testing 51
    res = client.get('/51')
    assert res.status_code == 200
    expected = {'result': 'FooBar'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_home_with_special_number_53(app, client):
    # testing 53
    res = client.get('/53')
    assert res.status_code == 200
    expected = {'result': 'BarFoo'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_home_with_special_number_21(app, client):
    # testing 21
    res = client.get('/21')
    assert res.status_code == 200
    expected = {'result': 'FooQix'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_home_with_special_number_13(app, client):
    # testing 13
    res = client.get('/13')
    assert res.status_code == 200
    expected = {'result': 'Foo'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_home_with_special_number_15(app, client):
    # testing 15
    res = client.get('/15')
    assert res.status_code == 200
    expected = {'result': 'FooBarBar'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_home_with_special_number_33(app, client):
    # testing 33
    res = client.get('/33')
    assert res.status_code == 200
    expected = {'result': 'FooFooFoo'}
    assert expected == json.loads(res.get_data(as_text=True))

def test_not_valid_input(app, client):
    res = client.get('/randomwrongstring')
    assert res.status_code == 200
    assert res.get_data(as_text=True) == 'You must request an integer or "/ready"'
