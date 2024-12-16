import requests
from json import dumps

def get():
    print('-----------------')
    print('Get user info')
    path = 'http://localhost:19000/api/users'
    expected = 200
    print(f'\tpath: {path}')

    try:
        req = requests.get(url=path)
        status_code = req.status_code
        if(status_code == expected):
            print("\tOK")
            return True
    except BaseException as exception:
        print(f"\tKO, expected: {expected}")
        print(f'\tError while fetching path: {path}, error: {exception}')
        return False

def list():
    print('-----------------')
    print('Get users list')
    path = 'http://localhost:19000/api/users/list'
    expected = 200
    print(f'\tpath: {path}')

    try:
        req = requests.get(url=path)
        status_code = req.status_code
        if(status_code == expected):
            print("\tOK")
            return True
    except BaseException as exception:
        print(f"\tKO, expected: {expected}")
        print(f'\tError while fetching path: {path}, error: {exception}')
        return False

def update():
    print('-----------------')
    print('Update user')
    path = 'http://localhost:19000/api/users'
    expected = 200
    print(f'\tpath: {path}')
    data = {
        "username": "test",
        "first_name": "test",
        "last_name": "test",
        "email": "test@live.fr"
    }
    json_data = dumps(data)

    try:
        req = requests.put(url=path, data=json_data)
        status_code = req.status_code
        if(status_code == expected):
            print("\tOK")
            return True
    except BaseException as exception:
        print(f"\tKO, expected: {expected}")
        print(f'\tError while fetching path: {path}, error: {exception}')
        return False

if __name__ == "__main__":
    print('User test case:')
    results = [get(), list(), update()]
    exit(0 if all(results) else 1)