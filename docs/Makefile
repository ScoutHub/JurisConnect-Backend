CC = g++
SRC = parser.cpp
CC_FLAGS = -Wall -Wextra -std=c++11
TARGET = parser

$(TARGET): $(SRC)
	$(CC) -o $(TARGET) $(SRC) $(CC_FLAGS)

clean:
	rm -f $(TARGET)

.PHONY: all clean
