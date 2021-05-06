# pico autobuild
A tool to make compiling and uploading my RPi Pico code as effortless as possible (Work in progress.)

## Current state (what it does and what has to be done manually)
**for now target_link_libraries have to be manually specified (edited) in script**
* copies pico_sdk_import.cmake to .
* creates CMakeLists.txt
* builds the project and copies binary file to project directory
* asks to try to upload the binary to RPi pico (has to be connected while having bootsel button pressed)

example of use:
```./pico_build.sh my_project main.c```

## ToDo
Planned features
- [x] setting up CMakeLists
- [x] building project
- [x] uploading to connected RPi Pico
- [ ] installing compiler and setting up pico-sdk (if necessary)
- [ ] pico sdk as a submodule rather than copying from existing user directory
- [ ] docker integration
- [ ] automatically guessing target_link_libraries in CMakeLists.txt
