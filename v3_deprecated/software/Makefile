BUILD_DIR=../build/digilent_arty

include $(BUILD_DIR)/software/include/generated/variables.mak
include $(SOC_DIRECTORY)/software/common.mak

#OBJECTS   = donut.o helloc.o main.o crt0.o
OBJECTS   = main.o crt0.o
ifdef WITH_CXX
	OBJECTS += hellocpp.o
endif

all: demo.bin

# pull in dependency info for *existing* .o files
-include $(OBJECTS:.o=.d)

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@
	chmod -x $@

demo.elf: $(OBJECTS)
	#$(CC) -print-search-dirs $(LDFLAGS) 
	$(CC) $(LDFLAGS) \
		-T linker.ld \
		-N -o $@ \
		$(OBJECTS) \
        -L../build/digilent_arty/software/libc -L../build/digilent_arty/software/libcompiler_rt -L../build/digilent_arty/software/libfatfs -L../build/digilent_arty/software/liblitespi -L../build/digilent_arty/software/liblitedram -L../build/digilent_arty/software/libliteeth -L../build/digilent_arty/software/liblitesdcard -L../build/digilent_arty/software/liblitesata -L../build/digilent_arty/software/bios -L../build/digilent_arty/software/libbase \
        -lcompiler_rt -lliteeth -lc -lbase \
		$(LIBS:lib%=-l%)
		#$(PACKAGES:%=-L$(BUILD_DIR)/software/%) 
	chmod -x $@

main.o: main.c
	$(compile)

crt0.o: $(CPU_DIRECTORY)/crt0.S
	$(assemble)

donut.o: CFLAGS += -w

helloc.o: CFLAGS += -w

hellocpp.o: CXXFLAGS += -w

%.o: %.cpp
	$(compilexx)

%.o: %.c
	$(compile)

%.o: %.S
	$(assemble)

clean:
	$(RM) $(OBJECTS) $(OBJECTS:.o=.d) demo.elf demo.bin .*~ *~

.PHONY: all main.o clean load
