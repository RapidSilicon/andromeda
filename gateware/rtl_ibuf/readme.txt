-> updates July 22
1. ICSR/BEFDR/BOFDR are changed to Read only
2. MSCR's LSB works as frame_grab enable and asserting it disables write access to ICCR and IBDR, to gain access deassert MSCR's LSB
3. Enabling frame_grab starts auto i2c reads targeted at sensor's RAM
4. Auto read values are saved in the BRAMs 0/1
5. BEFDR and BOFDR registers can be accessed to read the BRAM contents one by one

to do:
1. Add indication to ICSR that a frame is ready to be read
2. Add STAT register polling logic

-> updates July 28
1. The ICSR is now tied to frame grab logic and indicates completion of a frame
2. STAT register polling logic is also added
3. Basic testing of the IP is done
4. Synthesis is done
5. i2c master was tested on hardware and actual communication with the sensor was successfully made
