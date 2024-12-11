#ifndef _AUTH_ROUTES_H
#define _AUTH_ROUTES_H

#include <string>
#include <iostream>

#include "crow.h"
#include "jwt/jwt.hpp"

#include "utils/DatabaseManager.hpp"
#include "../Auth.hpp"
#include "../Token.hpp"

#include "utils/HttpUtils.hpp"
#include "utils/ApiMiddleware.hpp"

using namespace std;
using namespace jwt::params;

crow::json::wvalue generate_json_token(string &id)
{
    jwt::jwt_object access_token = Token::generate_access_token(id);
    jwt::jwt_object refresh_token = Token::generate_refresh_token(id);

    crow::json::wvalue json_resp;

    json_resp["access_token"] = access_token.signature();
    json_resp["refresh_token"] = refresh_token.signature();

    return json_resp;
}

void setup_auth_routes(crow::App<ApiMiddleware, crow::CORSHandler> &app, DatabaseManager &database_manager)
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

        optional<string> id = Auth::login(&database_manager, email, password);

        if (!id.has_value())
            return crow::response(NOT_FOUND, "Wrong email / password");

        return crow::response(RESPONSE_OK, generate_json_token(*id));
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
        if (!body.has("last_name") || !body.has("first_name") || !body.has("email") || !body.has("username") || !body.has("password") || !body.has("confirm_password"))
            return crow::response(BAD_REQUEST, "Missing fields (email | firstname | lastname | username | password)");

        string email = body["email"].s();
        string firstname = body["first_name"].s();
        string lastname = body["last_name"].s();
        string username = body["username"].s();
        string password = body["password"].s();
        string confirm_password = body["confirm_password"].s();

        if (password != confirm_password)
            return crow::response(BAD_REQUEST, "Password doesn't match");

        optional<string> id = Auth::createAccount(&database_manager, email, username, firstname, lastname, password);
        if(!id.has_value())
            return crow::response(BAD_REQUEST, "Failed to create an account");

        return crow::response(CREATED, generate_json_token(*id));
    });

    /*
        route: /auth/refresh/token
        method: GET
        headers:
            X-REFRESH-TOKEN: string refresh_token
    */
    CROW_ROUTE(app, "/auth/refresh/token")([&database_manager](const crow::request &req)
    {
        string token = req.get_header_value("X-REFRESH-TOKEN");
        if(!Token::check_token(token))
            return crow::response(UNAUTHORIZED, "Invalid Token");
        
        string id = Token::get_id(token);

        return crow::response(RESPONSE_OK, generate_json_token(id));
    });
}

#endif