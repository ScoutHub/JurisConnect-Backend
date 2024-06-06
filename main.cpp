#include <iostream>
#include "crow.h"
#include <string>
#include "headers/DatabaseManager.h"

#define LISTEN_PORT 19000

using namespace std;


int main(void)
{
	DatabaseManager database_manager;

	crow::SimpleApp app;

	CROW_ROUTE(app, "/")([](){
		return "Hello world";
	});

	CROW_ROUTE(app, "/api/users")([&database_manager](){
		string response = "";
		database_manager.get_users(response);
		return response;
	});

	app.port(LISTEN_PORT).multithreaded().run();
	return 0;
}
