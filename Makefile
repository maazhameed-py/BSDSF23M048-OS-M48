# Compiler and flags
CC = gcc
CFLAGS = -Wall -Iinclude -fPIC   # -fPIC needed for shared libs

# Directories
SRC_DIR = src
BIN_DIR = bin
OBJ_DIR = obj
LIB_DIR = lib
MAN_DIR = man/man3       # where your man pages are

# Files
STATIC_LIB = $(LIB_DIR)/libmyutils.a
DYNAMIC_LIB = $(LIB_DIR)/libmyutils.so
TARGET_STATIC = $(BIN_DIR)/client_static
TARGET_DYNAMIC = $(BIN_DIR)/client_dynamic
MAN_PAGE = $(MAN_DIR)/mycat.1

# Sources (adjust as needed)
UTIL_SOURCES = $(SRC_DIR)/mystrfunctions.c $(SRC_DIR)/myfilefunctions.c
CLIENT_SOURCE = $(SRC_DIR)/main.c

# Objects
UTIL_OBJECTS = $(UTIL_SOURCES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
CLIENT_OBJECT = $(CLIENT_SOURCE:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Default target
all: $(TARGET_STATIC) $(TARGET_DYNAMIC)

# --- Object file rules ---
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# --- Static Library ---
$(STATIC_LIB): $(UTIL_OBJECTS)
	@mkdir -p $(LIB_DIR)
	ar rcs $@ $^
	ranlib $@

$(TARGET_STATIC): $(CLIENT_OBJECT) $(STATIC_LIB)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $(CLIENT_OBJECT) -L$(LIB_DIR) -lmyutils

# --- Shared Library ---
$(DYNAMIC_LIB): $(UTIL_OBJECTS)
	@mkdir -p $(LIB_DIR)
	$(CC) -shared -o $@ $^

$(TARGET_DYNAMIC): $(CLIENT_OBJECT) $(DYNAMIC_LIB)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $(CLIENT_OBJECT) -L$(LIB_DIR) -lmyutils

# --- Install target for executable and man page ---
PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man3

install: $(TARGET_DYNAMIC)
	@echo "Installing executable to $(BINDIR)"
	sudo mkdir -p $(BINDIR)
	sudo cp $(TARGET_DYNAMIC) $(BINDIR)/client

	@echo "Installing man page to $(MANDIR)"
	sudo mkdir -p $(MANDIR)
	sudo cp $(MAN_PAGE) $(MANDIR)/
	sudo gzip -f $(MANDIR)/mycat.1

	@echo "Installation complete!"

# --- Utility rules ---
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR)

run_static: $(TARGET_STATIC)
	./$(TARGET_STATIC)

run_dynamic: $(TARGET_DYNAMIC)
	LD_LIBRARY_PATH=$(LIB_DIR) ./$(TARGET_DYNAMIC)

