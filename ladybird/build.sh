#!/bin/sh

# install build depends
# apk add g++ gcc samurai cmake ccache qt6-qtbase-dev pulseaudio-dev mpc1-dev
# get serenity
# git clone https://github.com/SerenityOS/serenity
# cd serenity
cmake -GNinja -S Ladybird -B Build/ladybird
cmake --build Build/ladybird
SERENITY_SOURCE_DIR=$PWD ./Build/ladybird/bin/Ladybird -C Build/ladybird/Lagom/cacert.pem
