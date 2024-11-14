#include <string.h>
#include "jwt/jwt.hpp"

using namespace jwt::params;
using namespace std;

class Token
{
public:
    Token() {};
    ~Token() {};
    static jwt::jwt_object generate_token(string &email);
    static bool check_token(string &token);
};