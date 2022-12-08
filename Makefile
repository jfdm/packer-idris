.PHONY: alpine idris verilator

alpine:
	make -C alpine alpine

idris:
	make -C idris idris

verilator:
	make -C verilator verilator

example:
	make -C example example
# -- [ EOF ]
