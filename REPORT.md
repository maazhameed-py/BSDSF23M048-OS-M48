# Assignment Report

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

