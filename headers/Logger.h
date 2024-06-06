#ifndef LOGGER_H
#define LOGGER_H

class Logger {
public:
	static void Info(const char* message, ...);
	static void Error(const char* message, ...);
};

#endif
