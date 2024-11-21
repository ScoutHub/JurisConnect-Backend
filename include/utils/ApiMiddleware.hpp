#ifndef _AUTH_MIDDLEWARE_H
#define _AUTH_MIDDLEWARE_H

#include <iostream>
#include <string>

#include "crow.h"
#include "Token.hpp"

using namespace std;

struct ApiMiddleware : crow::ILocalMiddleware
{
    struct context
    {
        string id;
    };

    void before_handle(crow::request &req, crow::response &res, context &ctx)
    {
        string bearer = req.get_header_value("Authorization");

        if (bearer.size() == 0) {
            res.code = 403;
            res.end();
            return;
        }
        string token = bearer.substr(7);

        if (!Token::check_token(token)) {
            res.code = 403;
            res.end();
            return;
        }

        ctx.id = Token::get_id(token);
    }

    void after_handle(crow::request &req, crow::response &res, context &ctx)
    {
    }
};

#endif