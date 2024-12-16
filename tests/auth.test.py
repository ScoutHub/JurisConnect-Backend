import requests

def login():
    print('-----------------')
    print('Login')
    path = 'http://localhost:19000/auth/login'
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

def register():
    print('-----------------')
    print('Register')
    path = 'http://localhost:19000/auth/register'
    expected = 201
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

if __name__ == "__main__":
    print('Authentication test case:')
    results = [login(), register()]
    exit(0 if all(results) else 1)