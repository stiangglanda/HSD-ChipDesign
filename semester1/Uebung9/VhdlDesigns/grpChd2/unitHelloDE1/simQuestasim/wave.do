onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -divider "Sequential Control"
add wave -noupdate -format Logic /tbhellode1/Clk
add wave -noupdate -format Logic /tbhellode1/nReset
add wave -divider "Input Switches"
add wave -noupdate -format Logic /tbhellode1/SW
add wave -divider Outputs
add wave -noupdate -format Logic /tbhellode1/sevenSeg0
add wave -noupdate -format Logic /tbhellode1/sevenSeg1
add wave -noupdate -format Logic /tbhellode1/led
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100 ns} 0}
configure wave -namecolwidth 132
configure wave -valuecolwidth 54
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1000 ns}
