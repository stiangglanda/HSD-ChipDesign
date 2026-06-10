vlib work
vcom -work work ../../../grpPackages/pkgGlobal/src/Global-p.vhd
vcom -work work ../../../grpChd2/unitHex2SevenSegment/src/Hex2SevenSegment-e.vhd
vcom -work work ../../../grpChd2/unitHex2SevenSegment/src/Hex2SevenSegment-Rtl-a.vhd
vcom -work work ../../../grpChd2/unitHelloDE1/src/HelloDE1-e.vhd
vcom -work work ../../../grpChd2/unitHelloDE1/src/HelloDE1-Rtl-a.vhd
vcom -work work ../../../grpChd2/unitHelloDE1/src/tbHelloDE1-e.vhd
vcom -work work ../../../grpChd2/unitHelloDE1/src/tbHelloDE1-Bhv-a.vhd
vsim -voptargs=+acc work.tbHelloDE1(Bhv)
do wave.do
run 1000 ms
