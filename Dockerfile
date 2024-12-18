FROM gcc:14.2.0

RUN apt-get update && apt-get install -y \
	git \
	cmake \
	libboost-dev \
	libboost-regex-dev \
	libasio-dev \
	libmariadb3 \
	libmariadb-dev \ 
	nlohmann-json3-dev \
	libgtest-dev \
	libssl-dev

WORKDIR /app

COPY . .

RUN chmod +x ./install_lib.sh && ./install_lib.sh

EXPOSE 19000

CMD ["make"]