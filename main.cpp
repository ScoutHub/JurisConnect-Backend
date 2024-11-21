#include <time.h>

#include "crow.h"
#include "DatabaseManager.hpp"
#include "routes/ApiUser.hpp"
#include "routes/AuthRoutes.hpp"
#include "utils/ApiMiddleware.hpp"

#define LISTEN_PORT 19000

int main(void)
{
	srand(time(NULL));

	DatabaseManager database_manager;
	crow::App<ApiMiddleware> app;

	setup_auth_routes(app, database_manager);
	setup_user_routes(app, database_manager);

	app.port(LISTEN_PORT).multithreaded().run();
	return 0;
}
