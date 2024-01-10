#ifndef DATABASE_MANAGER_H
#define DATABASE_MANAGER_H

#include <mariadb/conncpp.hpp>
#include <string>
#include <memory>

using namespace std;

class DatabaseManager {

private:
	unique_ptr<sql::Connection> conn;

public:
	DatabaseManager();
	~DatabaseManager(){}

	void get_users(string& response);
};

#endif
