#include <string>

#include "Auth.hpp"
#include "DatabaseManager.hpp"
#include "User.hpp"
#include "bcrypt.h"

#define ROUND 4

using namespace std;

bool Auth::login(DatabaseManager *databaseManager, string username, string password)
{
    try
    {
        unique_ptr<sql::PreparedStatement> stmnt(databaseManager->get_conn()->prepareStatement("SELECT password FROM users WHERE username = ?"));
        stmnt->setString(1, username);
        unique_ptr<sql::ResultSet> res(stmnt->executeQuery());

        string hashedPassword = "";
        if (res->next())
        {
            hashedPassword = res->getString("password");
        }
        return bcrypt::validatePassword(password, hashedPassword);
    }
    catch (sql::SQLException &e)
    {
        cerr << "Error selecting user: " << e.what() << endl;
        return false;
    }
}

bool Auth::createAccount(DatabaseManager *databaseManager, string email, string username, string firstname, string lastname, string password)
{
    password = bcrypt::generateHash(password, ROUND);
    return User::save(databaseManager, new User(lastname, firstname, email, username, password));
}
