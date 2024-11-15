#include <string>
#include <chrono>

#include "jwt/jwt.hpp"
#include "Token.hpp"
#include "Logger.hpp"

using namespace jwt::params;
using namespace std;

#define SECRET                "secretkey"
#define ALGORITHM             "HS256"
#define ACCESS_TOKEN_DURATION  3600   // in seconds
#define REFRESH_TOKEN_DURATION 43830  // in minutes

jwt::jwt_object Token::generate_access_token(string &email)
{
    jwt::jwt_object token{algorithm(ALGORITHM), payload({{"email", email}}), secret(SECRET)};
    token.add_claim("exp", chrono::system_clock::now() + chrono::seconds{ACCESS_TOKEN_DURATION});

    return token;
}

jwt::jwt_object Token::generate_refresh_token(string &email)
{
    jwt::jwt_object token{algorithm(ALGORITHM), payload({{"email", email}}), secret(SECRET)};
    token.add_claim("exp", chrono::system_clock::now() + chrono::minutes{REFRESH_TOKEN_DURATION});

    return token;
}

bool Token::check_token(string &token)
{
    try
    {
        jwt::jwt_object dec_obj = jwt::decode(token, algorithms({ALGORITHM}), secret(SECRET));

        return true;
    }
    catch (...)
    {
        Logger::Error("Invalid Token");
    }
    return false;
}