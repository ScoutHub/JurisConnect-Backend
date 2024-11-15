#ifndef _TOKEN_H
#define _TOKEN_H

#include <string.h>
#include "jwt/jwt.hpp"

using namespace jwt::params;
using namespace std;

class Token
{
public:
    Token() {};
    ~Token() {};
    static jwt::jwt_object generate_access_token(string &email);
    static jwt::jwt_object generate_refresh_token(string &email);
    static string get_email(string &token);
    static bool check_token(string &token);
};

#endif