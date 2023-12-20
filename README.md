# JurisConnect backend
This app is fully written in C++ with Crow library to make web development easier.

# Requirements
There is only one requirement :
- <a href="https://www.docker.com">Docker</a><br>

Why Docker ? Because container will build everything without install or include anything.

# How to launch
`docker build . -t <image-name>`

`docker run -p 19000:19000 -it --rm <image-name>`

and go to http://localhost:19000.

The default port is 19000 but you can easily change it in macro defined in `main.cpp` file
