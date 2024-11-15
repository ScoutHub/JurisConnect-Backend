#ifndef _AUTH_ROUTES_H
#define _AUTH_ROUTES_H

#include <string>

#include "crow.h"
#include "jwt/jwt.hpp"

#include "DatabaseManager.hpp"
#include "Auth.hpp"
#include "Token.hpp"

#include "utils/HttpUtils.hpp"
#include "utils/ApiMiddleware.hpp"

using namespace std;
using namespace jwt::params;

crow::json::wvalue generate_json_token(string &email)
{
    jwt::jwt_object access_token = Token::generate_access_token(email);
    jwt::jwt_object refresh_token = Token::generate_refresh_token(email);

    crow::json::wvalue json_resp;

    json_resp["access_token"] = access_token.signature();
    json_resp["refresh_token"] = refresh_token.signature();
    
    return json_resp;
}

void setup_auth_routes(crow::App<ApiMiddleware> &app, DatabaseManager &database_manager)
{
    /*
        route: /auth/login
        method: POST
        body:
            string email
            string password
    */
    CROW_ROUTE(app, "/auth/login").methods(crow::HTTPMethod::Post)([&database_manager](const crow::request &req)
    {
        crow::json::rvalue body = crow::json::load(req.body);

        if (!body)
            return crow::response(BAD_REQUEST, "Invalid JSON format");
        if (!body.has("email") || !body.has("password"))
            return crow::response(BAD_REQUEST, "Missing email or password");

        string email = body["email"].s();
        string password = body["password"].s();

        if (!Auth::login(&database_manager, email, password))
            return crow::response(RESPONSE_OK, "Wrong email / password");

        return crow::response(RESPONSE_OK, generate_json_token(email));
    });

    /*
        route: /auth/register
        method: POST
        body:
            string email
            string username
            string firstName
            string lastName
            string password
            string confirmPassword
    */
    CROW_ROUTE(app, "/auth/register").methods(crow::HTTPMethod::Post)([&database_manager](const crow::request &req)
    {
        crow::json::rvalue body = crow::json::load(req.body);

        if (!body)
            return crow::response(BAD_REQUEST, "Invalid JSON format");
        if (!body.has("lastName") || !body.has("firstName") || !body.has("email") || !body.has("username") || !body.has("password") || !body.has("confirmPassword"))
            return crow::response(BAD_REQUEST, "Missing fields (email | firstname | lastname | username | password)");

        string email = body["email"].s();
        string firstname = body["firstName"].s();
        string lastname = body["lastName"].s();
        string username = body["username"].s();
        string password = body["password"].s();
        string confirm_password = body["confirmPassword"].s();

        if (password != confirm_password)
            return crow::response(BAD_REQUEST, "Password doesn't match");

        if(!Auth::createAccount(&database_manager, email, username, firstname, lastname, password))
            return crow::response(BAD_REQUEST, "Failed to create an account");

        return crow::response(CREATED, generate_json_token(email));
    });
}

#endif