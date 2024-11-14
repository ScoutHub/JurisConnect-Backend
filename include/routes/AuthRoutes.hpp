#ifndef _AUTH_ROUTES_H
#define _AUTH_ROUTES_H

#include <string>

#include "crow.h"
#include "jwt/jwt.hpp"

#include "DatabaseManager.hpp"
#include "Auth.hpp"
#include "Token.hpp"

using namespace std;
using namespace jwt::params;

crow::json::wvalue generate_json_token(string &email)
{
    jwt::jwt_object token = Token::generate_token(email);
    crow::json::wvalue json_resp;
    json_resp["email"] = email;
    json_resp["token"] = token.signature();
    
    return json_resp;
}

void setupAuthRoutes(crow::SimpleApp &app, DatabaseManager &database_manager)
{
    CROW_ROUTE(app, "/auth/login").methods(crow::HTTPMethod::Post)([&database_manager](const crow::request &req)
    {
        crow::json::rvalue body = crow::json::load(req.body);

        if (!body)
            return crow::response(400, "Invalid JSON format");
        if (!body.has("email") || !body.has("password"))
            return crow::response(400, "Missing email or password");

        string email = body["email"].s();
        string password = body["password"].s();

        if (!Auth::login(&database_manager, email, password))
            return crow::response(200, "Wrong email / password");

        return crow::response(200, generate_json_token(email));
    });

    CROW_ROUTE(app, "/auth/register").methods(crow::HTTPMethod::Post)([&database_manager](const crow::request &req)
    {
        crow::json::rvalue body = crow::json::load(req.body);

        if (!body)
            return crow::response(400, "Invalid JSON format");
        if (!body.has("lastName") || !body.has("firstName") || !body.has("email") || !body.has("username") || !body.has("password") || !body.has("confirmPassword"))
            return crow::response(400, "Missing fields (email | firstname | lastname | username | password)");

        string email = body["email"].s();
        string firstname = body["firstName"].s();
        string lastname = body["lastName"].s();
        string username = body["username"].s();
        string password = body["password"].s();
        string confirm_password = body["confirmPassword"].s();

        if (password != confirm_password)
            return crow::response(400, "Password doesn't match");

        if(!Auth::createAccount(&database_manager, email, username, firstname, lastname, password))
            return crow::response(400, "Failed to create an account");

        return crow::response(201, generate_json_token(email));
    });
}

#endif