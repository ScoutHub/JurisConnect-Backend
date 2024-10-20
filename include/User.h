#ifndef _USER_H
#define _USER_H

#include <string>
#include "crow.h"

using namespace std;

class User
{
private:
    int m_id;
    string m_lastname;
    string m_firstname;
    string m_username;
    string m_email;
    string m_password;

public:
    User();
    User(int id, string lastname, string firstname, string email, string username, string password) : m_id(id), m_lastname(lastname), m_firstname(firstname), m_username(username), m_email(email), m_password(password) {}
    ~User() {};

    crow::json::wvalue to_json() const
    {
        crow::json::wvalue json_obj;
        json_obj["lastname"] = m_lastname;
        json_obj["firstname"] = m_firstname;
        json_obj["username"] = m_username;
        json_obj["email"] = m_email;
        return json_obj;
    }
};

#endif
