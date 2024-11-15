#include <string>
#include <chrono>

#include "jwt/jwt.hpp"
#include "Token.hpp"
#include "Logger.hpp"

using namespace jwt::params;
using namespace std;

#define SECRET "secretkey"
#define ALGORITHM "HS256"

jwt::jwt_object Token::generate_token(string &email)
{
    jwt::jwt_object token{algorithm(ALGORITHM), payload({{"email", email}}), secret(SECRET)};
    token.add_claim("exp", chrono::system_clock::now() + chrono::seconds{10});

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