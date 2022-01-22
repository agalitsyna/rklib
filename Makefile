CC=gcc
CFLAGS=-O3 -I.
DEPS = rklib/librk.h
BIN = ./bin/
BUILD = ./build/
SOURCE = ./source/

all: $(BIN)/fasta2hash $(BIN)/fastq2hash $(BIN)/rk_pairwise $(BIN)/rk_querysearch

OBJ = $(BUILD)/librk.o $(BUILD)/fasta2hash.o
$(BUILD)/%.o: rklib/%.c $(DEPS)
	mkdir -p $(BUILD)
	$(CC) -c -o $@ $< $(CFLAGS)
$(BIN)/fasta2hash: $(OBJ)
	mkdir -p $(BIN)
	$(CC) -o $@ $^ $(CFLAGS)

OBJ = $(BUILD)/librk.o $(BUILD)/fastq2hash.o
$(BUILD)/%.o: rklib/%.c $(DEPS)
	mkdir -p $(BUILD)
	$(CC) -c -o $@ $< $(CFLAGS)
$(BIN)/fastq2hash: $(OBJ)
	mkdir -p $(BIN)
	$(CC) -o $@ $^ $(CFLAGS)

OBJ = $(BUILD)/librk.o $(BUILD)/rk_pairwise.o
$(BUILD)/%.o: rklib/%.c $(DEPS)
	mkdir -p $(BUILD)
	$(CC) -c -o $@ $< $(CFLAGS)
$(BIN)/rk_pairwise: $(OBJ)
	mkdir -p $(BIN)
	$(CC) -o $@ $^ $(CFLAGS)

OBJ = $(BUILD)/librk.o $(BUILD)/rk_querysearch.o
$(BUILD)/%.o: rklib/%.c $(DEPS)
	mkdir -p $(BUILD)
	$(CC) -c -o $@ $< $(CFLAGS)
$(BIN)/rk_querysearch: $(OBJ)
	mkdir -p $(BIN)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -rf $(BUILD)
	rm -rf $(BIN)