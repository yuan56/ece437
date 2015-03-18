onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache_tb/CLK
add wave -noupdate /dcache_tb/CPUCLK
add wave -noupdate /dcache_tb/nRST
add wave -noupdate -group dcache /dcache_tb/DUT/CLK
add wave -noupdate -group dcache /dcache_tb/DUT/nRST
add wave -noupdate -group dcache /dcache_tb/DUT/curr_state
add wave -noupdate -group dcache /dcache_tb/DUT/next_state
add wave -noupdate -group dcache /dcache_tb/DUT/daddr
add wave -noupdate -group dcache /dcache_tb/DUT/Blk1_Word1
add wave -noupdate -group dcache /dcache_tb/DUT/Blk1_Word2
add wave -noupdate -group dcache /dcache_tb/DUT/Blk2_Word1
add wave -noupdate -group dcache /dcache_tb/DUT/Blk2_Word2
add wave -noupdate -group dcache /dcache_tb/DUT/Blk1_Valid
add wave -noupdate -group dcache /dcache_tb/DUT/Blk2_Valid
add wave -noupdate -group dcache /dcache_tb/DUT/Blk1_Dirty
add wave -noupdate -group dcache /dcache_tb/DUT/Blk2_Dirty
add wave -noupdate -group dcache /dcache_tb/DUT/Blk1_mru
add wave -noupdate -group dcache /dcache_tb/DUT/Blk2_mru
add wave -noupdate -group dcache /dcache_tb/DUT/Blk1_Tag
add wave -noupdate -group dcache /dcache_tb/DUT/Blk2_Tag
add wave -noupdate -group dcache /dcache_tb/DUT/dhit
add wave -noupdate -group dcache /dcache_tb/DUT/blk1en
add wave -noupdate -group dcache /dcache_tb/DUT/blk2en
add wave -noupdate -group dcache /dcache_tb/DUT/word1en
add wave -noupdate -group dcache /dcache_tb/DUT/word2en
add wave -noupdate -group dcache /dcache_tb/DUT/WBaddr
add wave -noupdate -group dcache /dcache_tb/DUT/valid1
add wave -noupdate -group dcache /dcache_tb/DUT/valid2
add wave -noupdate -group dcache /dcache_tb/DUT/nmru1
add wave -noupdate -group dcache /dcache_tb/DUT/nmru2
add wave -noupdate -group dcache /dcache_tb/DUT/ndirty1
add wave -noupdate -group dcache /dcache_tb/DUT/ndirty2
add wave -noupdate -group dcache /dcache_tb/DUT/nextTag1
add wave -noupdate -group dcache /dcache_tb/DUT/nextTag2
add wave -noupdate -group dcache /dcache_tb/DUT/nextword
add wave -noupdate -group dcache /dcache_tb/DUT/writeb1w1
add wave -noupdate -group dcache /dcache_tb/DUT/writeb1w2
add wave -noupdate -group dcache /dcache_tb/DUT/writeb2w1
add wave -noupdate -group dcache /dcache_tb/DUT/writeb2w2
add wave -noupdate -group dcache /dcache_tb/DUT/i
add wave -noupdate /dcache_tb/MC/ccif/iwait
add wave -noupdate /dcache_tb/MC/ccif/dwait
add wave -noupdate /dcache_tb/MC/ccif/iREN
add wave -noupdate /dcache_tb/MC/ccif/dREN
add wave -noupdate /dcache_tb/MC/ccif/dWEN
add wave -noupdate /dcache_tb/DUT/dcif/dhit
add wave -noupdate /dcache_tb/DUT/dcif/datomic
add wave -noupdate /dcache_tb/DUT/dcif/dmemREN
add wave -noupdate /dcache_tb/DUT/dcif/dmemWEN
add wave -noupdate /dcache_tb/DUT/dcif/dmemload
add wave -noupdate /dcache_tb/DUT/dcif/dmemstore
add wave -noupdate /dcache_tb/DUT/dcif/dmemaddr
add wave -noupdate /dcache_tb/MC/ccif/dload
add wave -noupdate /dcache_tb/MC/ccif/dstore
add wave -noupdate /dcache_tb/MC/ccif/daddr
add wave -noupdate /dcache_tb/MC/ccif/ramWEN
add wave -noupdate /dcache_tb/MC/ccif/ramREN
add wave -noupdate /dcache_tb/MC/ccif/ramstate
add wave -noupdate /dcache_tb/MC/ccif/ramaddr
add wave -noupdate /dcache_tb/MC/ccif/ramstore
add wave -noupdate /dcache_tb/MC/ccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {1713 ps}
