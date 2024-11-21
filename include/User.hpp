#ifndef _USER_H
#define _USER_H

#include <string>
#include <optional>
#include "crow.h"

using namespace std;
class DatabaseManager;

class User
{
private:
    string m_id;
    string m_lastname;
    string m_firstname;
    string m_username;
    string m_email;
    string m_password;

public:
    User() {}
    User(string id, string lastname, string firstname, string email, string username) : m_id(id), m_lastname(lastname), m_firstname(firstname), m_username(username), m_email(email) {}
    User(string id, string lastname, string firstname, string email, string username, string password) : m_id(id), m_lastname(lastname), m_firstname(firstname), m_username(username), m_email(email), m_password(password) {}
    ~User() {};

    crow::json::wvalue to_json() const
    {
        crow::json::wvalue json_obj;
        json_obj["id"] = m_id;
        json_obj["lastName"] = m_lastname;
        json_obj["firstName"] = m_firstname;
        json_obj["username"] = m_username;
        json_obj["email"] = m_email;
        return json_obj;
    }

    string getId() { return this->m_id; }
    string getLastname() { return this->m_lastname; }
    string getFirstname() { return this->m_firstname; }
    string getUsername() { return this->m_username; }
    string getEmail() { return this->m_email; }
    string getPassword() { return this->m_password; }

    void setPassword(string password) { this->m_password = password; }

    static vector<User> getAll(DatabaseManager *databaseManager);
    static bool save(DatabaseManager *databaseManager, User *user);
    static optional<User> get(DatabaseManager *databaseManager, string id);
};

#endif
