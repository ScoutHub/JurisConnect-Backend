#ifndef _API_USER_H
#define _API_USER_H

#include "crow.h"
#include "DatabaseManager.hpp"
#include "User.hpp"

#include "utils/HttpUtils.hpp"
#include "utils/ApiMiddleware.hpp"

using namespace std;

void setup_user_routes(crow::App<ApiMiddleware> &app, DatabaseManager& database_manager) {
    /*
        route: /api/users
        method: GET
    */
    CROW_ROUTE(app, "/api/users").CROW_MIDDLEWARES(app, ApiMiddleware)([&database_manager]()
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
        route: /api/users/id
        method: GET
        params:
            string id
    */
    CROW_ROUTE(app, "/api/users/<string>").CROW_MIDDLEWARES(app, ApiMiddleware)([&database_manager](const string& id)
    {
        optional<User> user = User::get(&database_manager, id);
        
        if (!user.has_value()) {
            return crow::response(NOT_FOUND, "User not found");
        }

        crow::json::wvalue json_resp;
        json_resp = user->to_json();
        return crow::response(RESPONSE_OK, json_resp);
    });
}


#endif