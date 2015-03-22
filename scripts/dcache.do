onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache_tb/CLK
add wave -noupdate /dcache_tb/CPUCLK
add wave -noupdate /dcache_tb/nRST
add wave -noupdate /dcache_tb/DUT/dcif/halt
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/CLK
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nRST
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/curr_state
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/next_state
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/daddr
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/dhit
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/blk1en
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/blk2en
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/word1en
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/word2en
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/WBaddr
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/valid1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/valid2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nmru1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nmru2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/ndirty1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/ndirty2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nextTag1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nextTag2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nextword
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/writeb1w1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/writeb1w2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/writeb2w1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/writeb2w2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/i
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk1_Dirty
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk1_Tag
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk1_Valid
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk1_Word1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk1_Word2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk1_mru
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk2_Dirty
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk2_Tag
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk2_Valid
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk2_Word1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk2_Word2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/Blk2_mru
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/CLK
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/WBaddr
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/blk1en
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/blk2en
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/curr_state
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/daddr
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/dhit
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/i
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nRST
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/ndirty1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/ndirty2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nextTag1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nextTag2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/next_state
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nextword
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nmru1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/nmru2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/valid1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/valid2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/word1en
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/word2en
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/writeb1w1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/writeb1w2
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/writeb2w1
add wave -noupdate -expand -group Dcache /dcache_tb/DUT/writeb2w2
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/halt
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/ihit
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/imemREN
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/imemload
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/imemaddr
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/dhit
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/datomic
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/dmemREN
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/dmemWEN
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/flushed
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/dmemload
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/dmemstore
add wave -noupdate -expand -group Datapath->Controller /dcache_tb/DUT/dcif/dmemaddr
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/iwait
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/dwait
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/iREN
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/dREN
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/dWEN
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/iload
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/dload
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/dstore
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/iaddr
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/daddr
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/ccwait
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/ccinv
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/ccwrite
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/cctrans
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/ccsnoopaddr
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/ramWEN
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/ramREN
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/ramstate
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/ramaddr
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/ramstore
add wave -noupdate -group Cache->Controller /dcache_tb/DUT/ccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3919711 ps} 0}
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
WaveRestoreZoom {0 ps} {4116 ns}
