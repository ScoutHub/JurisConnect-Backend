#include <iostream>
#include <string>
#include <vector>

#include "crow.h"
#include "bcrypt.h"
#include "DatabaseManager.h"
#include "User.h"

#define LISTEN_PORT 19000

using namespace std;

int main(void)
{
	DatabaseManager database_manager;

	crow::SimpleApp app;

	CROW_ROUTE(app, "/test")([]()
	{
		return "Hello World"; 
	});

	CROW_ROUTE(app, "/test/bcrypt")([]()
	{
		return bcrypt::generateHash("Test"); 
	});

	CROW_ROUTE(app, "/api/users")([&database_manager]()
	{
		vector<User> users;
		User::get_all(&database_manager, &users);
		crow::json::wvalue json_resp;
    	json_resp["users"] = crow::json::wvalue::list();

		vector<crow::json::wvalue> json_users;
		for (const auto &user : users)
		{
			json_users.push_back(user.to_json());
		}
		json_resp["users"] = move(json_users);
		
    	return json_resp;
	});

	CROW_ROUTE(app, "/auth/login").methods(crow::HTTPMethod::Post)([](const crow::request &req)
	{
        auto body = crow::json::load(req.body);

        if (!body)
            return crow::response(400, "Invalid JSON format");
        if (!body.has("username") || !body.has("password"))
            return crow::response(400, "Missing username or password");

        string username = body["username"].s();
        string password = body["password"].s();

        return crow::response(200, "Login successful for user: " + username);
	});

	CROW_ROUTE(app, "/auth/register").methods(crow::HTTPMethod::Post)([](const crow::request &req)
	{
        auto body = crow::json::load(req.body);

        if (!body)
            return crow::response(400, "Invalid JSON format");
        if (!body.has("lastname") || !body.has("firstname") || !body.has("email") || !body.has("username") || !body.has("password"))
            return crow::response(400, "Missing fields (email | firstname | lastname | username | password)");

		string email = body["username"].s();
        string firstname = body["password"].s();
		string lastname = body["password"].s();
        string username = body["username"].s();
        string password = body["password"].s();

        return crow::response(201, "Register successful");
	});

	app.port(LISTEN_PORT).multithreaded().run();
	return 0;
}
