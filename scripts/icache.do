onerror {resume}
quietly virtual function -install /icache_tb/RAM -env /icache_tb/RAM { &{/icache_tb/RAM/CLK, /icache_tb/RAM/nRST, /icache_tb/RAM/count, /icache_tb/RAM/rstate, /icache_tb/RAM/q, /icache_tb/RAM/addr, /icache_tb/RAM/wren, /icache_tb/RAM/en }} RAM
quietly WaveActivateNextPane {} 0
add wave -noupdate /icache_tb/CLK
add wave -noupdate /icache_tb/CPUCLK
add wave -noupdate /icache_tb/nRST
add wave -noupdate /icache_tb/DUT/CLK
add wave -noupdate -group RAM /icache_tb/RAM/nRST
add wave -noupdate -group RAM /icache_tb/RAM/CLK
add wave -noupdate -group RAM /icache_tb/RAM/count
add wave -noupdate -group RAM /icache_tb/RAM/rstate
add wave -noupdate -group RAM /icache_tb/RAM/q
add wave -noupdate -group RAM /icache_tb/RAM/addr
add wave -noupdate -group RAM /icache_tb/RAM/wren
add wave -noupdate -group RAM /icache_tb/RAM/en
add wave -noupdate -group CONT /icache_tb/MC/ccif/iwait
add wave -noupdate -group CONT /icache_tb/MC/ccif/dwait
add wave -noupdate -group CONT /icache_tb/MC/ccif/iREN
add wave -noupdate -group CONT /icache_tb/MC/ccif/dREN
add wave -noupdate -group CONT /icache_tb/MC/ccif/dWEN
add wave -noupdate -group CONT /icache_tb/MC/ccif/iload
add wave -noupdate -group CONT /icache_tb/MC/ccif/dload
add wave -noupdate -group CONT /icache_tb/MC/ccif/dstore
add wave -noupdate -group CONT /icache_tb/MC/ccif/iaddr
add wave -noupdate -group CONT /icache_tb/MC/ccif/daddr
add wave -noupdate -group CONT /icache_tb/MC/ccif/ccwait
add wave -noupdate -group CONT /icache_tb/MC/ccif/ccinv
add wave -noupdate -group CONT /icache_tb/MC/ccif/ccwrite
add wave -noupdate -group CONT /icache_tb/MC/ccif/cctrans
add wave -noupdate -group CONT /icache_tb/MC/ccif/ccsnoopaddr
add wave -noupdate -group CONT /icache_tb/MC/ccif/ramWEN
add wave -noupdate -group CONT /icache_tb/MC/ccif/ramREN
add wave -noupdate -group CONT /icache_tb/MC/ccif/ramstate
add wave -noupdate -group CONT /icache_tb/MC/ccif/ramaddr
add wave -noupdate -group CONT /icache_tb/MC/ccif/ramstore
add wave -noupdate -group CONT /icache_tb/MC/ccif/ramload
add wave -noupdate -expand -group ICACHE /icache_tb/DUT/CLK
add wave -noupdate -expand -group ICACHE /icache_tb/DUT/nRST
add wave -noupdate -expand -group ICACHE /icache_tb/DUT/iaddr
add wave -noupdate -expand -group ICACHE /icache_tb/DUT/iaddr_ram
add wave -noupdate -expand -group ICACHE /icache_tb/DUT/curr_state
add wave -noupdate -expand -group ICACHE /icache_tb/DUT/next_state
add wave -noupdate -expand -group ICACHE /icache_tb/DUT/Valid
add wave -noupdate -expand -group ICACHE /icache_tb/DUT/Word_Blk
add wave -noupdate -expand -group ICACHE /icache_tb/DUT/Tag
add wave -noupdate -expand -group ICACHE /icache_tb/DUT/nv
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1384 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {12202 ps}
