# Compiler and flags
CC = gcc
CFLAGS = -Wall -Iinclude

# Directories
SRC_DIR = src
BIN_DIR = bin
OBJ_DIR = obj
LIB_DIR = lib

# Files
TARGET = $(BIN_DIR)/client_static
SOURCES = $(SRC_DIR)/main.c
OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
LIB_OBJECTS = $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o
LIB = $(LIB_DIR)/libmyutils.a

# Default rule
all: $(TARGET)

# Linking rule for main program
$(TARGET): $(OBJECTS) $(LIB)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $(OBJECTS) -L$(LIB_DIR) -lmyutils

# Build static library
$(LIB): $(LIB_OBJECTS)
	@mkdir -p $(LIB_DIR)
	ar rcs $@ $^
	ranlib $@

# Compile main object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Compile utility object files
$(OBJ_DIR)/mystrfunctions.o: $(SRC_DIR)/mystrfunctions.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/myfilefunctions.o: $(SRC_DIR)/myfilefunctions.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build files
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR)

# Run program
run: $(TARGET)
	./$(TARGET)

