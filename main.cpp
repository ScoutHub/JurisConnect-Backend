#include <iostream>
#include <string>
#include <vector>

#include "crow.h"
#include "jwt/jwt.hpp"

#include "DatabaseManager.hpp"
#include "User.hpp"
#include "Auth.hpp"

// STATUS CODE
#define BAD_REQUEST 400
#define RESPONSE_OK 200
#define CREATED     201

#define LISTEN_PORT 19000

using namespace std;
using namespace jwt::params;

int main(void)
{
	DatabaseManager database_manager;
	crow::SimpleApp app;

	string key = "secret";
	jwt::jwt_object obj{algorithm("HS256"), payload({{"some", "token"}}), secret(key)};

	string enc_str = obj.signature();
  	cout << "token: " << enc_str << endl;

	auto dec_obj = jwt::decode(enc_str, algorithms({"HS256"}), secret(key));
	string some_value = dec_obj.payload().get_claim_value<string>("some");
  	cout << "some_value: " << some_value << endl;

	CROW_ROUTE(app, "/test")([]()
	{
		return "Hello World"; 
	});

	CROW_ROUTE(app, "/api/users")([&database_manager]()
	{
		vector<User> users = User::getAll(&database_manager);
		crow::json::wvalue json_resp;
    	json_resp["users"] = crow::json::wvalue::list();

		vector<crow::json::wvalue> json_users;
		for (const User &user : users)
		{
			json_users.push_back(user.to_json());
		}
		json_resp["users"] = move(json_users);
	
	    return crow::response(RESPONSE_OK, json_resp);
	});

	CROW_ROUTE(app, "/auth/login").methods(crow::HTTPMethod::Post)([&database_manager](const crow::request &req)
	{
        crow::json::rvalue body = crow::json::load(req.body);

        if (!body)
            return crow::response(BAD_REQUEST, "Invalid JSON format");
        if (!body.has("username") || !body.has("password"))
            return crow::response(BAD_REQUEST, "Missing username or password");

        string username = body["username"].s();
        string password = body["password"].s();

        return crow::response(RESPONSE_OK, Auth::login(&database_manager, username, password) ? "Login successful" : "Wrong username / password");
	});

	CROW_ROUTE(app, "/auth/register").methods(crow::HTTPMethod::Post)([&database_manager](const crow::request &req)
	{
        crow::json::rvalue body = crow::json::load(req.body);

        if (!body)
            return crow::response(BAD_REQUEST, "Invalid JSON format");
        if (!body.has("lastName") || !body.has("firstName") || !body.has("email") || !body.has("username") || !body.has("password") || !body.has("confirmPassword"))
            return crow::response(BAD_REQUEST, "Missing fields (email | firstname | lastname | username | password)");

		string email = body["email"].s();
        string firstname = body["firstName"].s();
		string lastname = body["lastName"].s();
        string username = body["username"].s();
        string password = body["password"].s();
		string confirm_password = body["confirmPassword"].s();
		
		if(password != confirm_password)
		    return crow::response(BAD_REQUEST, "Password doesn't match");

		const bool registerSuccessful = Auth::createAccount(&database_manager, email, username, firstname, lastname, password);
		if(!registerSuccessful) return crow::response(BAD_REQUEST, "Failed to create an account");
        return crow::response(CREATED, "Register successful");
	});

	app.port(LISTEN_PORT).multithreaded().run();
	return 0;
}
