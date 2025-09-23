# BSDSF23M048-OS-M48


## Overview
This project is a hands-on programming assignment for the Operating Systems course. Its goal is to develop a modular C utility library (`libmyutils`) with string and file manipulation functions, and a main driver program that uses these functions. The project emphasizes professional software development practices including modular programming, static and dynamic libraries, Makefile automation, man page documentation, and proper Git/GitHub workflows.

---

## Features

1. **Multi-file Project Compilation**
   - All source files (`.c`) compiled and linked into a single executable.
   - Demonstrates multi-file project structure and Makefile automation.

2. **Static Library (`libmyutils.a`)**
   - Custom utility library containing string and file functions.
   - Demonstrates archiving with `ar` and symbol inspection with `nm` and `readelf`.

3. **Dynamic Library (`libmyutils.so`)**
   - Shared library version of `libmyutils`.
   - Demonstrates dynamic linking, position-independent code (`-fPIC`), and `LD_LIBRARY_PATH`.

4. **Man Pages and Installation**
   - Standard Linux `man` page for the client program (`mycat`).
   - Makefile `install` target to copy executable and man page to standard locations.

5. **Version Control & Releases**
   - Git workflow with branches for each feature (`multifile-build`, `static-build`, `dynamic-build`, `man-pages`).
   - Annotated Git tags and GitHub releases for each stable version.


## Project Structure

├── src/ # Source code for library and driver program
├── include/ # Header files for utility functions
├── lib/ # Compiled static and dynamic libraries
├── bin/ # Executable programs
├── obj/ # Object files
├── man/man3/ # Man pages for programs
├── REPORT.md # Analysis and answers to assignment questions
├── Makefile # Build and installation automation
└── README.md # Project overview



---

## Build and Run

### 1. Build All Targets

make

### 2. Run Executables

Static client: ./bin/client_static

Dynamic client: LD_LIBRARY_PATH=lib ./bin/client_dynamic

### 3. Install Client and Man Page

sudo make install

### 4. VIEW
man mycat

## Git Workflow

Each major feature was developed in a separate branch.

Branches were merged into main after completion.

Annotated tags mark stable releases:

v0.1.1-multifile → Initial multi-file build

v0.2.1-static → Static library build

v0.3.1-dynamic → Dynamic library build

v0.4.1-final → Final build with man page and install target

## Author

Maaz Hameed
Email: maazhameed181@gmail.com



## Project Structure

