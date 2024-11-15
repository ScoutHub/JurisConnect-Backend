#ifndef _AUTH_MIDDLEWARE_H
#define _AUTH_MIDDLEWARE_H

#include "crow.h"
#include <iostream>
#include <string>

using namespace std;

struct ApiMiddleware : crow::ILocalMiddleware
{
    struct context
    {
    };

    void before_handle(crow::request &req, crow::response &res, context &ctx)
    {
        string bearer = req.get_header_value("Authorization");
        string token = bearer.substr(7);

        cout << "Token: " << token << endl;
    }

    void after_handle(crow::request &req, crow::response &res, context &ctx)
    {
    }
};

#endif