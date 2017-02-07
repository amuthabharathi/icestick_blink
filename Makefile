PROJ=blink

all: $(PROJ).bin
	iceprog $(PROJ).bin

.PHONY : all


$(PROJ).blif : $(PROJ).v
	yosys -p "read_verilog $^; synth_ice40 -blif $(PROJ).blif"

$(PROJ).txt : $(PROJ).blif $(PROJ).pcf
	arachne-pnr -d 1k -p $(PROJ).pcf $(PROJ).blif -o $(PROJ).txt 

$(PROJ).bin : $(PROJ).txt
	icepack $^ $(PROJ).bin

flash: $(PROJ).bin
	iceprog $^
	
clean:
	rm -f $(PROJ).blif $(PROJ).txt $(PROJ).bin


	 
