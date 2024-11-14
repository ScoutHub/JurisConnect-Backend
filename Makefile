CC = g++
CC_FLAGS = -I./Bcrypt.cpp/include/ -I./include/ -lpthread -lmariadbcpp -lcrypto
SRC = main.cpp $(wildcard src/*.cpp) $(wildcard Bcrypt.cpp/src/*.cpp)
TARGET = main

all: $(TARGET)
	./$(TARGET)

$(TARGET): $(SRC)
	$(CC) -o $(TARGET) $(SRC) $(CC_FLAGS)

clean:
	rm -f $(TARGET)

cleanall: clean
	rm -f *.o

.PHONY: all clean cleanall
