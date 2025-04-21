.PHONY: all clean run

# Compiler settings
CXX = g++
CXXFLAGS = -I ./inc -std=c++11
WARNINGS = -g -Wall

# Source files and object files
SRCDIR = src
OBJDIR = inc
SRCS = $(wildcard $(SRCDIR)/*.cpp)
OBJS = $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SRCS))

# Name of the executable
TARGET = Lab07

all: $(TARGET)

$(TARGET): main.cpp $(OBJS)
	$(CXX) $(WARNINGS) $(CXXFLAGS) $^ -o $@

# Compilation rule for object files with automatic dependency generation
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR) Makefile
	$(CXX) $(WARNINGS) $(CXXFLAGS) -c $< -o $@
