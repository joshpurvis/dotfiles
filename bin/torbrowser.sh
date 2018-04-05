#!/bin/bash

docker run --name torbrowser -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY paulczar/torbrowser && docker rm torbrowser
