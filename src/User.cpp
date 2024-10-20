#include <string>
#include "User.h"
#include "DatabaseManager.h"

using namespace std;

void User::get_all(DatabaseManager *databaseManager, vector<User> *users)
{
    try
    {
        unique_ptr<sql::Statement> stmnt(databaseManager->get_conn()->createStatement());
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
