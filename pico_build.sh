#!/bin/bash

#TODO fix target_link_libraries to feature all necessary libraries automatically (?)

echo "Assuming pico-sdk at ~/pico/pico-sdk"

# $1 - project name
# $2 - name of c file for compilation

cp $HOME/pico/pico-sdk/external/pico_sdk_import.cmake pico_sdk_import.cmake

echo "cmake_minimum_required(VERSION 3.13)

# initialize the SDK based on PICO_SDK_PATH
# note: this must happen before project()
include(pico_sdk_import.cmake)

project($1)

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

# rest of your project
add_executable($1
	$2
	)

# Add pico_stdlib library which aggregates commonly used features
target_link_libraries($1 pico_stdlib hardware_pwm)

# create map/bin/hex/uf2 file in addition to ELF.
pico_add_extra_outputs($1)" > CMakeLists.txt

mkdir build
cd build
cmake ..
make

cp $1.uf2 ..

echo "Attempt to copy binary straight to RPI-RP2 (requires connection in BOOSTEL mode)"

select yn in "Yes" "No"; do
	case $yn in
		Yes ) cp $1.uf2 /media/$USER/RPI-RP2/$1.uf2; break;;
		No ) exit;;
	esac
done

