#include <string>
#include "User.h"
#include "DatabaseManager.h"

using namespace std;

vector<User> User::getAll(DatabaseManager *databaseManager)
{
    try
    {
        vector<User> users;
        unique_ptr<sql::Statement> stmnt(databaseManager->get_conn()->createStatement());
        sql::ResultSet *res = stmnt->executeQuery("select * from users");
        while (res->next())
        {
            int id = (int)res->getInt(1);
            string email = (string)res->getString(2);
            string username = (string)res->getString(3);
            string lastname = (string)res->getString(4);
            string firstname = (string)res->getString(5);

            User user(id, lastname, firstname, email, username);

            users.push_back(user);
        }
        delete res;
        return users;
    }
    catch (sql::SQLException &e)
    {
        cerr << "Error fetching users: " << e.what() << endl;
        return {};
    }
}

bool User::save(DatabaseManager *databaseManager, User *user)
{
    try
    {
        unique_ptr<sql::PreparedStatement> pstmt(databaseManager->get_conn()->prepareStatement(
            "INSERT INTO users (lastname, firstname, email, username, password) VALUES (?, ?, ?, ?, ?) "
            "ON DUPLICATE KEY UPDATE lastname = VALUES(lastname), firstname = VALUES(firstname), "
            "email = VALUES(email), password = VALUES(password)"));

        pstmt->setString(1, user->getLastname());
        pstmt->setString(2, user->getFirstname());
        pstmt->setString(3, user->getEmail());
        pstmt->setString(4, user->getUsername());
        pstmt->setString(5, user->getPassword());
        pstmt->executeUpdate();
        return true;
    }
    catch (sql::SQLException &e)
    {
        std::cerr << "Error saving user: " << e.what() << std::endl;
        return false;
    }
}
