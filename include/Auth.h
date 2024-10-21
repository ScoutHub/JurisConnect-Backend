#ifndef _AUTH_H
#define _AUTH_H

#include <string>

class DatabaseManager;
using namespace std;

class Auth
{
public:
    static bool login(DatabaseManager *databaseManager, string username, string password);
    static bool createAccount(DatabaseManager *databaseManager,
                              string email,
                              string username,
                              string firstname,
                              string lastname,
                              string password);
};

#endif