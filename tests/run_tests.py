from os import path, listdir
from os.path import isfile, join
from typing import List
import subprocess

def run_test_cases(test_files: List[str]) -> int:
    n_success = 0
    for test in test_files:
        print('###############')
        result = subprocess.run(
            ["python", test],
            capture_output=True,
            text=True
        )
        print(result.stdout, end='')
        if(result.returncode == 0):
            n_success += 1
    return n_success

if __name__ == "__main__":
    test_files = [f for f in listdir(".") if isfile(join(".", f))]
    test_files.remove(path.basename(__file__))

    print('Running test cases...')
    n_success = run_test_cases(test_files)
    if(n_success == len(test_files)):
        print('\nOK: All test passed')
    else:
        print('\nKO: Test cases not passed')