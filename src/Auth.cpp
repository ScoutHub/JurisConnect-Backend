#include <string>

#include "Auth.hpp"
#include "DatabaseManager.hpp"
#include "User.hpp"
#include "bcrypt.h"

#define ROUND 4

using namespace std;

optional<string> Auth::login(DatabaseManager *databaseManager, string email, string password)
{
    try
    {
        unique_ptr<sql::PreparedStatement> stmnt(databaseManager->get_conn()->prepareStatement("SELECT password, id FROM users WHERE email = ?"));
        stmnt->setString(1, email);
        unique_ptr<sql::ResultSet> res(stmnt->executeQuery());

        string hashedPassword = "";
        if (res->next())
        {
            hashedPassword = res->getString("password");
            if (bcrypt::validatePassword(password, hashedPassword))
                return string(res->getString("id"));
        }
        return nullopt;
    }
    catch (sql::SQLException &e)
    {
        cerr << "Error selecting user: " << e.what() << endl;
        return nullopt;
    }
}

optional<string> Auth::createAccount(DatabaseManager *databaseManager, string email, string username, string firstname, string lastname, string password)
{
    const string uuid = DatabaseManager::generate_uuid();
    password = bcrypt::generateHash(password, ROUND);

    if (!User::save(databaseManager, new User(uuid, lastname, firstname, email, username, password)))
    {
        return nullopt;
    }
    return uuid;
}
