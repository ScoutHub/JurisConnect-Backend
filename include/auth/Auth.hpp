#ifndef _AUTH_H
#define _AUTH_H

#include <string>
#include <optional>

class DatabaseManager;
using namespace std;

class Auth
{
public:
    static optional<string> login(DatabaseManager *databaseManager, string username, string password);
    static optional<string> createAccount(DatabaseManager *databaseManager,
                              string email,
                              string username,
                              string firstname,
                              string lastname,
                              string password);
};

#endif