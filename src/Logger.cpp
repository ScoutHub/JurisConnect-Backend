#include <cstdio>
#include <iostream>
#include <cstdarg>
#include "Logger.h"

using namespace std;

void Logger::Info(const char* message, ...)
{
	va_list args;
	va_start(args, message);
	cout << "[INFO]: ";
	vprintf(message, args);
	cout << endl;

	va_end(args);
}

void Logger::Error(const char* message, ...)
{
	va_list args;
	va_start(args, message);
	cout << "[ERROR]: ";
	vprintf(message, args);
	cout << endl;

	va_end(args);
}

