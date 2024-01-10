FROM gcc:latest

RUN apt-get update && apt-get install -y \
    git \
    cmake \
    libboost-dev \
    libboost-regex-dev \
	libasio-dev \
	libmariadb3 \
	libmariadb-dev

WORKDIR /root
RUN wget https://dlm.mariadb.com/2531503/Connectors/cpp/connector-cpp-1.0.2/mariadb-connector-cpp-1.0.2-debian-bullseye-aarch64.tar.gz && \
	tar -xvzf mariadb-connector-cpp-*.tar.gz && \
	cd mariadb-connector-cpp-*/ && \
	install -d /usr/include/mariadb/conncpp && \
	install -d /usr/include/mariadb/conncpp/compat && \
	install include/mariadb/*.* /usr/include/mariadb/ && \
	install include/mariadb/conncpp/*.* /usr/include/mariadb/conncpp && \
	install include/mariadb/conncpp/compat/*.* /usr/include/mariadb/conncpp/compat && \
	install -d /usr/lib/mariadb && \
	install -d /usr/lib/mariadb/plugin && \
	install lib/mariadb/libmariadbcpp.so /usr/lib && \
	install lib/mariadb/plugin/*.* /usr/lib/mariadb/plugin


WORKDIR /app

RUN git clone https://github.com/CrowCpp/Crow.git

WORKDIR /app/Crow
RUN mkdir build && cd build && cmake .. -DCROW_BUILD_EXAMPLES=OFF -DCROW_BUILD_TESTS=OFF && make install

WORKDIR /app

COPY . .

RUN g++ -o main main.cpp src/*.cpp -lpthread -lmariadbcpp

EXPOSE 19000

CMD ["./main"]

