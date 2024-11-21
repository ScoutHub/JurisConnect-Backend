#include "User.hpp"
#include "DatabaseManager.hpp"

vector<User> User::getAll(DatabaseManager *databaseManager)
{
    try
    {
        vector<User> users;
        unique_ptr<sql::Statement> stmnt(databaseManager->get_conn()->createStatement());
        sql::ResultSet *res = stmnt->executeQuery("select * from users");
        while (res->next())
        {
            string id = (string)res->getString(1);
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
            "INSERT INTO users (id, last_name, first_name, email, username, password) VALUES (?, ?, ?, ?, ?, ?) "
            "ON DUPLICATE KEY UPDATE id = VALUES(id), last_name = VALUES(last_name), first_name = VALUES(first_name), "
            "email = VALUES(email), password = VALUES(password)"));

        pstmt->setString(1, user->getId());
        pstmt->setString(2, user->getLastname());
        pstmt->setString(3, user->getFirstname());
        pstmt->setString(4, user->getEmail());
        pstmt->setString(5, user->getUsername());
        pstmt->setString(6, user->getPassword());
        pstmt->executeUpdate();
        return true;
    }
    catch (sql::SQLException &e)
    {
        std::cerr << "Error saving user: " << e.what() << std::endl;
        return false;
    }
}

optional<User> User::get(DatabaseManager *databaseManager, string id)
{
    try
    {
        unique_ptr<sql::PreparedStatement> stmnt(databaseManager->get_conn()->prepareStatement("SELECT id, last_name, first_name, email, username FROM users WHERE id = ?"));
        stmnt->setString(1, id);
        unique_ptr<sql::ResultSet> res(stmnt->executeQuery());

        if (res->next())
        {
            const string id = string(res->getString("id"));
            const string email = string(res->getString("email"));
            const string last_name = string(res->getString("last_name"));
            const string first_name = string(res->getString("first_name"));
            const string username = string(res->getString("username"));

            return User(id, last_name, first_name, email, username);
        }
        return nullopt;
    }
    catch (sql::SQLException &e)
    {
        cerr << "Error fetching user: " << e.what() << endl;
        return nullopt;
    }
}