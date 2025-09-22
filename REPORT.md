# Assignment Report

## Feature-2: Multi-file Project using Make Utility
## Linking Rule in Makefile

- `$(TARGET): $(OBJECTS)` builds the executable from object files.
- Compiles outdated objects and links them.
- **Note:** Linking against a library uses precompiled code; objects in the library are not rebuilt.

## Git Tag

- Marks a specific commit as a version.
- Useful for versioning and referencing stable releases.
- Types of tags:
  - **Simple tag:** just a name pointing to a commit.
  - **Annotated tag:** includes metadata (tagger, date, message) and can be signed.

## GitHub Release

- Officially shares a version of the project.
- Attaching **binaries** allows users to download and run the program without compiling.

-----------------------------------------------------------------------------------------------------------------------------------------------------------


## Feature-3: Static Library Build

### Makefile Comparison
- Part 2 compiled all source files directly into the executable.
- Part 3 compiles utility functions into a static library (`libmyutils.a`) and links the main program against it.
- Key differences: new variables `LIB` and `LIB_DIR`; new rules for creating the library using `ar rcs` and linking with `-lmyutils`.

### Purpose of ar and ranlib
- `ar` creates a static library by archiving object files into a `.a` file.
- `ranlib` generates an index of symbols in the library so the linker can efficiently find functions.
- Using both ensures proper static linking.

### Static Linking Observation
- Symbols like `mystrlen` do not appear as undefined because they are statically linked.
- This shows the code for the functions is included directly in the executable, unlike dynamic linking where symbols are resolved at runtime.


