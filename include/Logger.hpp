#ifndef _LOGGER_H
#define _LOGGER_H

class Logger
{
public:
	static void Info(const char *message, ...);
	static void Error(const char *message, ...);
};

#endif
