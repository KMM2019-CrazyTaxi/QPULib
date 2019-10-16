# Root directory of QPULib repository
ROOT = Lib

# Compiler and default flags
CXX = clang++
CXX_FLAGS = -std=c++17 -I $(ROOT) -DQPU_MODE

# Object directory
OBJ_DIR := obj-qpu

# Object files
OBJ =                         \
  Kernel.o                    \
  Source/Syntax.o             \
  Source/Int.o                \
  Source/Float.o              \
  Source/Stmt.o               \
  Source/Pretty.o             \
  Source/Translate.o          \
  Source/Interpreter.o        \
  Source/Gen.o                \
  Target/Syntax.o             \
  Target/SmallLiteral.o       \
  Target/Pretty.o             \
  Target/RemoveLabels.o       \
  Target/CFG.o                \
  Target/Liveness.o           \
  Target/RegAlloc.o           \
  Target/ReachingDefs.o       \
  Target/Subst.o              \
  Target/LiveRangeSplit.o     \
  Target/Satisfy.o            \
  Target/LoadStore.o          \
  Target/Emulator.o           \
  Target/Encode.o             \
  VideoCore/Mailbox.o         \
  VideoCore/Invoke.o          \
  VideoCore/VideoCore.o

# Top-level targets

LIB = $(patsubst %,$(OBJ_DIR)/%,$(OBJ))
MAIN = qpulib.a

all: $(MAIN)	
	@echo $(MAIN) has been compiled!

# Intermediate targets
$(MAIN): $(LIB)
	ar -r $(MAIN) $(LIB)

$(OBJ_DIR)/%.o: $(ROOT)/%.cpp $(OBJ_DIR)
	@echo Compiling $<
	@$(CXX) -c -o $@ $< $(CXX_FLAGS)

%.o: %.cpp
	@echo Compiling $<
	@$(CXX) -c -o $@ $< $(CXX_FLAGS)

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(OBJ_DIR)/Source
	@mkdir -p $(OBJ_DIR)/Target
	@mkdir -p $(OBJ_DIR)/VideoCore

clean:
	rm -rf obj obj-debug obj-qpu obj-debug-qpu
	rm -f Tri GCD Print MultiTri AutoTest OET Hello ReqRecv Rot3D ID *.o
  	rm -f HeatMap
	rm -f qpulib.a
  
