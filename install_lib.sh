#!/bin/sh

set -xe

# Install mariadb driver
cd /tmp && \
    wget https://dlm.mariadb.com/2531503/Connectors/cpp/connector-cpp-1.0.2/mariadb-connector-cpp-1.0.2-debian-bullseye-aarch64.tar.gz && \
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
    install lib/mariadb/plugin/*.* /usr/lib/mariadb/plugin && \
    rm -rf /tmp/*

# Clone libraries
cd /app && \
    git clone https://github.com/CrowCpp/Crow.git && \
    git clone https://github.com/hilch/Bcrypt.cpp && \
    git clone https://github.com/arun11299/cpp-jwt

# Install Crow
cd Crow && \
    mkdir build&& \
    cd build && \
    cmake .. -DCROW_BUILD_EXAMPLES=OFF -DCROW_BUILD_TESTS=OFF && \
    make install&& \
    cd ../../

# Install Jwt
cd cpp-jwt && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make install
    cd ../../

# Delete repo
cd ../../ && \
    rm -rf Crow/ cpp-jwt/