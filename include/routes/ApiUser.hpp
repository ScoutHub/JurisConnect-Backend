#ifndef _API_USER_H
#define _API_USER_H

#include "crow.h"
#include "DatabaseManager.hpp"
#include "User.hpp"

void setupUserRoutes(crow::SimpleApp& app, DatabaseManager& database_manager) {
    CROW_ROUTE(app, "/api/users")([&database_manager]()
    {
        std::vector<User> users = User::getAll(&database_manager);
        crow::json::wvalue json_resp;
        json_resp["users"] = crow::json::wvalue::list();

        std::vector<crow::json::wvalue> json_users;
        for (const User& user : users) {
            json_users.push_back(user.to_json());
        }
        json_resp["users"] = std::move(json_users);

        return crow::response(200, json_resp);
    });
}


#endif