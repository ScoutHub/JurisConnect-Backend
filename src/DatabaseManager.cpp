#include "../headers/DatabaseManager.h"
#include "../headers/Logger.h"
#include <mariadb/conncpp.hpp>
#include <string>
#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

vector<string> get_env_file(const char *file_path)
{
	vector<string> vars;
	ifstream file(file_path);
	if(file) {
		string var;
		while(getline(file, var)) {
			vars.push_back(var.substr(var.find("=") + 1));
		}
		file.close();
	} else {
		Logger::Error("cannot open '%s' file", file_path);
	}
	return vars;
}

DatabaseManager::DatabaseManager()
{
	try {
		const char* env_path = ".env";
		const string mariadb_url = "jdbc:mariadb://mariadb:3306/";
		vector<string> env_vars = get_env_file(env_path);
	
		if(!env_vars.empty()) {
			sql::Driver* driver = sql::mariadb::get_driver_instance();

			sql::SQLString url(mariadb_url + env_vars[2]);
			sql::Properties properties({
				{"user", env_vars[0]},
				{"password", env_vars[1]}
			});

			this->conn.reset(driver->connect(url, properties));
			Logger::Info("connected to database");
		} else {
			Logger::Error("wrong .env file");
		}

	} catch(sql::SQLException& e){
		cerr << "Error Connecting to MariaDB Platform: " << e.what() << endl;
	}
}

void DatabaseManager::get_users(string& response)
{
    try {
        unique_ptr<sql::Statement> stmnt(this->conn->createStatement());
        sql::ResultSet *res = stmnt->executeQuery("select * from users");
        while(res->next()) {
			response += "id: " + to_string(res->getInt(1)) + ", ";
			response += "email: " + res->getString(2) + "\n";
        }
    }
    catch(sql::SQLException& e){
      cerr << "Error selecting users: " << e.what() << endl;
   }
}
