#ifndef _DATABASE_MANAGER_H
#define _DATABASE_MANAGER_H

#include <mariadb/conncpp.hpp>
#include <string>
#include <memory>
#include <vector>

#include "User.h"

using namespace std;

class DatabaseManager
{

private:
	unique_ptr<sql::Connection> conn;

public:
	DatabaseManager();
	~DatabaseManager() {}

	unique_ptr<sql::Connection> &get_conn();
};

#endif
