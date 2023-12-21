#include <iostream>
#include "crow.h"
#include <mariadb/conncpp.hpp>
#include <string.h>
#include <string>

#define LISTEN_PORT 19000

std::string showUsers(std::unique_ptr<sql::Connection> &conn) {
    try {
		std::string user = "";
        std::unique_ptr<sql::Statement> stmnt(conn->createStatement());
        sql::ResultSet *res = stmnt->executeQuery("select * from users");
        while (res->next()) {
			user += "id: " + std::to_string(res->getInt(1)) + ", ";
			user += "email: " + res->getString(2) + "\n";
        }
		return user;
    }
    catch(sql::SQLException& e){
      std::cerr << "Error selecting tasks: " << e.what() << std::endl;
   }
}

int main(void) {
	std::unique_ptr<sql::Connection> conn;
	try {
		sql::Driver* driver = sql::mariadb::get_driver_instance();

        sql::SQLString url("jdbc:mariadb://mariadb:3306/jurisconnect");
        sql::Properties properties({
			{"user", "mariadb"},
			{"password", "mariadb123"}
		});

		conn.reset(driver->connect(url, properties));
	} catch(sql::SQLException& e){
    	std::cerr << "Error Connecting to MariaDB Platform: " << e.what() << std::endl;
    	return 1;
	}

	crow::SimpleApp app;

	CROW_ROUTE(app, "/")([](){
        return "Hello world";
    });

	CROW_ROUTE(app, "/api/users")([&conn](){
		std::string res = showUsers(conn);
		return res;
	});

	app.port(LISTEN_PORT).multithreaded().run();
	return 0;
}
