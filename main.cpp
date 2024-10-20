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

	CROW_ROUTE(app, "/test")
	([]()
	 { return "Hello World"; });

	CROW_ROUTE(app, "/test/bcrypt")
	([]()
	 { return bcrypt::generateHash("Test"); });

	CROW_ROUTE(app, "/users")
	([]()
	 { return "Test users"; });

	CROW_ROUTE(app, "/api/users")
	([&database_manager]()
	 {
		vector<User> users;
		database_manager.get_users(&users);
		crow::json::wvalue json_resp;
    	json_resp["users"] = crow::json::wvalue::list();

		vector<crow::json::wvalue> json_users;
		for (const auto &user : users)
		{
			json_users.push_back(user.to_json());
		}
		json_resp["users"] = move(json_users);
		
    	return json_resp; });

	app.port(LISTEN_PORT).multithreaded().run();
	return 0;
}
