#include <mariadb/conncpp.hpp>
#include <string>
#include <iostream>
#include <fstream>
#include <vector>
#include <memory>

#include "DatabaseManager.h"
#include "Logger.h"
#include "User.h"

using namespace std;

vector<string> get_env_file(const char *file_path)
{
	vector<string> vars;
	ifstream file(file_path);
	if (file)
	{
		string var;
		while (getline(file, var))
		{
			vars.push_back(var.substr(var.find("=") + 1));
		}
		file.close();
	}
	else
	{
		Logger::Error("cannot open '%s' file", file_path);
	}
	return vars;
}

DatabaseManager::DatabaseManager()
{
	try
	{
		const char *env_path = ".env";
		vector<string> env_vars = get_env_file(env_path);

		if (!env_vars.empty())
		{
			const string mariadb_url = env_vars[4];
			sql::Driver *driver = sql::mariadb::get_driver_instance();

			sql::SQLString url(mariadb_url + env_vars[2]);
			sql::Properties properties({{"user", env_vars[0]},
										{"password", env_vars[1]}});

			this->conn.reset(driver->connect(url, properties));
			Logger::Info("connected to database");
		}
		else
		{
			Logger::Error("wrong .env file");
		}
	}
	catch (sql::SQLException &e)
	{
		cerr << "Error Connecting to MariaDB Platform: " << e.what() << endl;
	}
}

void DatabaseManager::get_users(vector<User> *users)
{
	try
	{
		unique_ptr<sql::Statement> stmnt(this->conn->createStatement());
		sql::ResultSet *res = stmnt->executeQuery("select * from users");
		while (res->next())
		{
			int id = (int)res->getInt(1);
			string email = (string)res->getString(2);
			string username = (string)res->getString(3);
			string lastname = (string)res->getString(4);
			string firstname = (string)res->getString(5);

			User user(id, lastname, firstname, email, username, "");

			users->push_back(user);
		}
		delete res;
	}
	catch (sql::SQLException &e)
	{
		cerr << "Error selecting users: " << e.what() << endl;
	}
}

unique_ptr<sql::Connection> &DatabaseManager::get_conn()
{
	return this->conn;
}
