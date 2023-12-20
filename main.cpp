#include <iostream>
#include "crow.h"

#define LISTEN_PORT 19000

int main(void) {
	crow::SimpleApp app;

	CROW_ROUTE(app, "/")([](){
        return "Hello world";
    });

	app.port(LISTEN_PORT).multithreaded().run();
	return 0;
}
