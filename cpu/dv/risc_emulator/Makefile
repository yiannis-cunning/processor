

defualt:
	rm -rf build
	mkdir build
	gcc emulator.c -o build/emulator

debug:
	rm -rf build
	mkdir build
	gcc emulator.c -o build/emulator_dbg -g

run_debug:
	gdb ./build/emulator_dbg ../assembly/main.ihex 1000


run:
	./build/emulator ../assembly/main.ihex 1000