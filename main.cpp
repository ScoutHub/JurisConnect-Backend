#include <time.h>

#include "crow.h"
#include "crow/middlewares/cors.h"

#include "utils/DatabaseManager.hpp"
#include "user/routes/ApiUser.hpp"
#include "auth/routes/AuthRoutes.hpp"
#include "utils/ApiMiddleware.hpp"

#define LISTEN_PORT 19000

int main(void)
{
	srand(time(NULL));

	DatabaseManager database_manager;
	crow::App<ApiMiddleware, crow::CORSHandler> app;

	auto &cors = app.get_middleware<crow::CORSHandler>();
	cors
		.global()
		.origin("*")
		.methods("GET"_method, "POST"_method, "PUT"_method, "DELETE"_method, "OPTIONS"_method)
		.headers("Content-Type", "Authorization", "X-Custom-Header")
		.max_age(3600);

	setup_auth_routes(app, database_manager);
	setup_user_routes(app, database_manager);

	app.port(LISTEN_PORT).multithreaded().run();
	return 0;
}
