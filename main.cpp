#include "crow.h"
#include "DatabaseManager.hpp"
#include "routes/ApiUser.hpp"
#include "routes/AuthRoutes.hpp"

// STATUS CODE
#define BAD_REQUEST 400
#define RESPONSE_OK 200
#define CREATED     201

#define LISTEN_PORT 19000

int main(void)
{
	DatabaseManager database_manager;
	crow::SimpleApp app;

	CROW_ROUTE(app, "/test")([]()
	{
		return "Hello World"; 
	});

    setupAuthRoutes(app, database_manager);
    setupUserRoutes(app, database_manager);

	app.port(LISTEN_PORT).multithreaded().run();
	return 0;
}
