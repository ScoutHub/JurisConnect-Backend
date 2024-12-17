#ifndef _API_USER_H
#define _API_USER_H

#include "crow.h"
#include "utils/DatabaseManager.hpp"
#include "../User.hpp"

#include "utils/HttpUtils.hpp"
#include "utils/ApiMiddleware.hpp"

using namespace std;

void setup_user_routes(crow::App<ApiMiddleware, crow::CORSHandler> &app, DatabaseManager& database_manager) {
    /*
        @Doc
        @Route("/api/users/list")
        @Name("Users list")
        @Description("Get registered users list")
        @Method(GET)
        @Header(Authorization: Bearer token)
    */
    CROW_ROUTE(app, "/api/users/list").CROW_MIDDLEWARES(app, ApiMiddleware)([&database_manager]()
    {
        vector<User> users = User::getAll(&database_manager);
        crow::json::wvalue json_resp;
        json_resp["users"] = crow::json::wvalue::list();

        vector<crow::json::wvalue> json_users;
        for (const User& user : users) {
            json_users.push_back(user.to_json());
        }
        json_resp["users"] = move(json_users);

        return crow::response(RESPONSE_OK, json_resp);
    });
    /*
        @Doc
        @Route("/api/users")
        @Name("User information")
        @Description("Get logged user information")
        @Method(GET)
        @Header(Authorization: Bearer token)
    */
    CROW_ROUTE(app, "/api/users").CROW_MIDDLEWARES(app, ApiMiddleware)([&database_manager, &app](const crow::request &req)
    {
        ApiMiddleware::context& ctx = app.get_context<ApiMiddleware>(req);
        string id = ctx.id;
        optional<User> user = User::get(&database_manager, id);
        
        if (!user.has_value()) {
            return crow::response(NOT_FOUND, "User not found");
        }

        crow::json::wvalue json_resp;
        json_resp = user->to_json();
        return crow::response(RESPONSE_OK, json_resp);
    });
    /*
        @Doc
        @Route("/api/users")
        @Name("User update")
        @Description("Update user information")
        @Method(PUT)
        @Header(Authorization: Bearer token)
        @Header(Content-Type: application/json)
        @Body(string last_name)
        @Body(string first_name)
        @Body(string email)
        @Body(string username)
    */
    CROW_ROUTE(app, "/api/users").CROW_MIDDLEWARES(app, ApiMiddleware).methods(crow::HTTPMethod::Put)([&database_manager, &app](const crow::request &req)
    {
		ApiMiddleware::context& ctx = app.get_context<ApiMiddleware>(req);
        string id = ctx.id;
        crow::json::rvalue body = crow::json::load(req.body);
        optional<User> user = User::get(&database_manager, id);
        
        if (!user.has_value()) {
            return crow::response(NOT_FOUND, "User not found");
        }

        user->setFirstName(body["first_name"].s());
        user->setLastName(body["last_name"].s());
        user->setUsername(body["username"].s());
        user->setEmail(body["email"].s());
        User::save(&database_manager, &(*user));

        crow::json::wvalue json_resp;
        json_resp = user->to_json();
        return crow::response(RESPONSE_OK, json_resp);
    });
}


#endif
